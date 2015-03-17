package org.etsi.uri.ts102204.etsi204_kiuru_wsdl;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;

/**
 * This class was generated by Apache CXF 3.0.0
 * 2015-02-10T10:55:20.768+01:00
 * Generated source version: 3.0.0
 * 
 */
@WebService(targetNamespace = "http://uri.etsi.org/TS102204/etsi204-kiuru.wsdl", name = "MSS_StatusQueryType")
@XmlSeeAlso({org.w3._2000._09.xmldsig_.ObjectFactory.class, ch.swisscom.mid.ts102204.as.v1.ObjectFactory.class, org.etsi.uri.ts102204.v1_1.ObjectFactory.class, org.w3._2003._05.soap_envelope.ObjectFactory.class, fi.ficom.mss.ts102204.v1_0.ObjectFactory.class, org.oasis_open.docs.wss._2004._01.oasis_200401_wss_wssecurity_utility_1_0.ObjectFactory.class, ch.swisscom.ts102204.ext.v1_0.ObjectFactory.class})
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface MSSStatusQueryType {

    @WebResult(name = "MSS_StatusResp", targetNamespace = "http://uri.etsi.org/TS102204/etsi204-kiuru.wsdl", partName = "MSS_StatusResp")
    @WebMethod(operationName = "MSS_StatusQuery")
    public org.etsi.uri.ts102204.v1_1.MSSStatusResp mssStatusQuery(
        @WebParam(partName = "MSS_StatusReq", name = "MSS_StatusReq")
        org.etsi.uri.ts102204.v1_1.MSSStatusReq mssStatusReq
    ) throws MSSFaultMessage;
}