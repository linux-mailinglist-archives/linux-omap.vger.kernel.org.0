Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6CC24C351
	for <lists+linux-omap@lfdr.de>; Thu, 20 Aug 2020 18:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbgHTQ11 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Aug 2020 12:27:27 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:46150 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgHTQ1Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Aug 2020 12:27:25 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07KGN5Ng185569;
        Thu, 20 Aug 2020 16:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=EhcIkdT5kS+atUJAy+/F2IziSwuZSev4/FziC9JMbe8=;
 b=es8IcqaQFxFBi8AOBf0kA9WnVstw9kZSFc/PyFOtBz+UWkIi7+UaU0ap4DkgJb91usSv
 H8seDxM3PiHpvM98191tO72kGt2d62EQYQ4B3Tbrl73uxugsOJhTTxasnZ7k4wqngt6p
 hBuCG1G+Rx0CGFvcj4/2GPoLjaoH6KUD/1+nfnc+OMRZvdMmnKn+F+wsiuFLt7y0Mfqj
 O95wqHhFLezeBP6BbwNNDjPIpgrgryE5Xlfs1DWjzoTr/4T5kkdbhYY+YHbKwJzlzF2e
 AGmv1p2TdlyaU3lIXloP2Q6BOE/oFOIeJ6EEEe/ap6VRhIkEAoh/x0RWSwk1VYW79TJk 1Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 32x8bnheph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Aug 2020 16:27:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07KGN2tT109476;
        Thu, 20 Aug 2020 16:27:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 32xsn1k4gv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 20 Aug 2020 16:27:12 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07KGRAig010695;
        Thu, 20 Aug 2020 16:27:10 GMT
Received: from [10.74.106.11] (/10.74.106.11)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 20 Aug 2020 09:27:10 -0700
Subject: Re: [PATCH 0/6] Add TI PRUSS platform driver
To:     Suman Anna <s-anna@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        ssantosh@kernel.org, Tony Lindgren <tony@atomide.com>
Cc:     robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com
References: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <12a7fc2a-4c48-655f-daa1-880fd1866fd1@ti.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <2a64dcb7-d79e-7ef8-b3e6-4c2533a19c38@oracle.com>
Date:   Thu, 20 Aug 2020 09:27:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <12a7fc2a-4c48-655f-daa1-880fd1866fd1@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9718 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008200133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9718 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008200133
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/20/20 7:43 AM, Suman Anna wrote:
> Hi Santosh, Tony,
> 
> On 7/29/20 6:02 AM, Grzegorz Jaszczyk wrote:
>> Hi,
>>
>> The Programmable Real-Time Unit and Industrial Communication Subsystem
>> (PRU-ICSS) is present on various TI SoCs. The IP is present on multiple TI SoC
>> architecture families including the OMAP architecture SoCs such as AM33xx,
>> AM437x and AM57xx; and on a Keystone 2 architecture based 66AK2G SoC. It is also
>> present on the Davinci based OMAPL138 SoCs and K3 architecture based AM65x and
>> J721E SoCs as well.
>>
>> A PRUSS consists of dual 32-bit RISC cores (Programmable Real-Time Units, or
>> PRUs), shared RAM, data and instruction RAMs, some internal peripheral modules
>> to facilitate industrial communication, and an interrupt controller.
>>
>> The programmable nature of the PRUs provide flexibility to implement custom
>> peripheral interfaces, fast real-time responses, or specialized data handling.
>> The common peripheral modules include the following,
>>    - an Ethernet MII_RT module with two MII ports
>>    - an MDIO port to control external Ethernet PHYs
>>    - an Industrial Ethernet Peripheral (IEP) to manage/generate Industrial
>>      Ethernet functions
>>    - an Enhanced Capture Module (eCAP)
>>    - an Industrial Ethernet Timer with 7/9 capture and 16 compare events
>>    - a 16550-compatible UART to support PROFIBUS
>>    - Enhanced GPIO with async capture and serial support
>>
>>
>> A typical usage scenario would be to load the application firmware into one or
>> more of the PRU cores, initialize one or more of the peripherals and perform I/O
>> through shared RAM from either a kernel driver or directly from userspace.
>>
>> This series contains the PRUSS platform driver. This is the parent driver for
>> the entire PRUSS and is used for managing the subsystem level resources like
>> various memories and the CFG module.  It is responsible for the creation and
>> deletion of the platform devices for the child PRU devices and other child
>> devices (like Interrupt Controller, MDIO node and some syscon nodes) so that
>> they can be managed by specific platform drivers.
>>
>> Grzegorz Jaszczyk (1):
>>    dt-bindings: soc: ti: Add TI PRUSS bindings
>>
>> Suman Anna (5):
>>    soc: ti: pruss: Add a platform driver for PRUSS in TI SoCs
>>    soc: ti: pruss: Add support for PRU-ICSSs on AM437x SoCs
>>    soc: ti: pruss: Add support for PRU-ICSS subsystems on AM57xx SoCs
>>    soc: ti: pruss: Add support for PRU-ICSS subsystems on 66AK2G SoC
>>    soc: ti: pruss: enable support for ICSSG subsystems on K3 AM65x SoCs
> 
> Do you have any comments on the driver portions of this series before Greg posts
> a v2 addressing the binding comments. This is one of the foundation series
> towards enabling PRUSS, and is a dependency for the PRU remoteproc driver.
> 
No just post V2 addressing Rob's comment. I will line it up once
rob acks it.

Regards,
Santosh
