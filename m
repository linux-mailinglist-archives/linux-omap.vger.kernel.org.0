Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2984C302137
	for <lists+linux-omap@lfdr.de>; Mon, 25 Jan 2021 05:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbhAYEiG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 24 Jan 2021 23:38:06 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:51930 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbhAYEh6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 24 Jan 2021 23:37:58 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P4YmDE139655;
        Mon, 25 Jan 2021 04:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=szoXrV/RFeXwfntAWWK5Bt/AJH3TXlpRkFzpc71lSSA=;
 b=ju0q6P16syKbWSwjYL1i958OzTdIcL9OPeFLr44Xvl7LBmzzf1/w5h86TXES761DLY6U
 h/avO6gWVRbgzsQ6yrDg8f9Rip/J0ZVzPV3EQbQWGUvOCPrIKeuMg+NaTusOHT1PtAat
 lKsdCIAcJI1YienytqboopOxZqMh9jHzB2Me9oFGbv3GptASCysey5LH0Xk3Ugt5SUCw
 yB6mbbDLvPP6W7tZMpbUcu89N0gDis+PU9CRSgvZLQcfyPxZz0rCqmgbzr48lDF5mQdk
 kS6rwpmix9QZObfVgu+fmusRlUNoVEYtSsGcoaXDoyfJuHjaXAJ5RT+tvEreV8Q88lre lg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 368brkbdpb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 04:36:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P4Yvr4144538;
        Mon, 25 Jan 2021 04:34:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 368wck37gb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Jan 2021 04:34:59 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10P4Ytjt010237;
        Mon, 25 Jan 2021 04:34:55 GMT
Received: from santoshs-mbp-3.lan (/69.181.241.203)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 24 Jan 2021 20:34:54 -0800
Subject: Re: [PATCH v2 0/5] Introduce PRU remoteproc consumer API
To:     Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>, ohad@wizery.com,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        ssantosh@kernel.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@kernel.org
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
 <20210106232704.GE9149@xps15> <11303a1b-5ab4-def5-77b1-c500894c9c87@ti.com>
 <20210107224448.GB43045@xps15> <75365443-57e3-e2e0-5865-f78af9d5890b@ti.com>
From:   "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Organization: Oracle Corporation
Message-ID: <b0e32ad0-487f-9d57-7287-835eee836514@oracle.com>
Date:   Sun, 24 Jan 2021 20:34:38 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <75365443-57e3-e2e0-5865-f78af9d5890b@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250024
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250024
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Suman, Mathieu,

On 1/7/21 2:49 PM, Suman Anna wrote:
> On 1/7/21 4:44 PM, Mathieu Poirier wrote:
>> On Wed, Jan 06, 2021 at 06:03:25PM -0600, Suman Anna wrote:
>>> Hi Mathieu,
>>>
[...]
>> I only see input from Andy and Lars in the thread you point out, nothing from
>> Greg.  I have also taken a look at the patch [1] that made checkpatch complain
>> about ENOTSUPP.  From what I see in that commit log the goal is to prevent new
>> additions of ENOTSUPP to the kernel.
>>
>> Please modify and resend, otherwise I'm sure someone will send another patch to
>> fix it before the end of the cycle.
> 
> Yeah ok. I will send out a v3.
> 
I haven't seen v3 of this series yet. Please post it
if you would like to include it for 5.12.

Regards,
Santosh
