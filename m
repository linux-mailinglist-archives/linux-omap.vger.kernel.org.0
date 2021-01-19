Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718F52FBD17
	for <lists+linux-omap@lfdr.de>; Tue, 19 Jan 2021 18:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389426AbhASQ7p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Jan 2021 11:59:45 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54422 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389173AbhASQ7Y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Jan 2021 11:59:24 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JGXWR0143590;
        Tue, 19 Jan 2021 16:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=sgdV4DlHNHTspbd/aK7hkeNWRoha9hMFwjn/ZmwVWQk=;
 b=N6ODgjzWnXRoegsWTwaFflZ7AM6NcT0c5vtyyMYYAXB5kuxnJ6eavvmWkBdXiZHEF6CR
 aAb3lnX+7LCGEazD06mBnK0XvmUubX4XqHFajisIhSoKVG8QtuP97odTL8qGVf9m8LLZ
 hEWvwyCpgefIrGHH6Qz/8wegaUpW0HDdkjKKWjj7avmOT2iGF1f3zNvSQHcX34oiTd6f
 4ODXLDIeJ6CUpO5Y6gg1wB2+2aaHVla/pucjEXLEddNsGN3cjpLoNzL+yM43SozyVVUs
 g8lG/gZHA41S1tCkgjQonycuvavpiN/O8M+9VpsvypAT63qxVOj3j3w5xkhFthgAsEjS rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 363xyhse4g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Jan 2021 16:57:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JGsbvn142094;
        Tue, 19 Jan 2021 16:57:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 3661khg06j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Jan 2021 16:57:49 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10JGvk9l005845;
        Tue, 19 Jan 2021 16:57:47 GMT
Received: from [10.74.104.209] (/10.74.104.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 19 Jan 2021 08:57:46 -0800
Subject: Re: [PATCH] dt-bindings: soc: ti: Update TI PRUSS bindings about
 schemas to include
To:     Suman Anna <s-anna@ti.com>
Cc:     Rob Herring <robh@kernel.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        tony@atomide.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        ssantosh@kernel.org, praneeth@ti.com, lee.jones@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201216225027.2681-1-grzegorz.jaszczyk@linaro.org>
 <20201221213234.GA596829@robh.at.kernel.org>
 <6f5b6609-bb9e-31f7-c0c2-3bb261a54d6a@ti.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <a080a917-9c37-088b-075b-7b5a5d49256d@oracle.com>
Date:   Tue, 19 Jan 2021 08:57:43 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <6f5b6609-bb9e-31f7-c0c2-3bb261a54d6a@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190096
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 1/15/21 8:38 AM, Suman Anna wrote:
> Hi Santosh,
> 
> On 12/21/20 3:32 PM, Rob Herring wrote:
>> On Wed, 16 Dec 2020 23:50:27 +0100, Grzegorz Jaszczyk wrote:
>>> Now after ti,pruss-intc.yaml and ti,pru-rproc.yaml are merged, include
>>> them in proper property and extend the examples section.
>>>
>>> At the occasion extend the allowed property list about dma-ranges.
>>>
>>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>> ---
>>>   .../devicetree/bindings/soc/ti/ti,pruss.yaml  | 76 +++++++++++++++++++
>>>   1 file changed, 76 insertions(+)
>>>
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
> 
> Gentle reminder, I haven't seen this patch yet on linux-next.
> Can you please pick this up for 5.12.
> 
Yes, will look into it this week.
