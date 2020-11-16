Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3A22B5087
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 20:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729105AbgKPTG5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 14:06:57 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35922 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729097AbgKPTG5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Nov 2020 14:06:57 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGJ4Q97016656;
        Mon, 16 Nov 2020 19:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=dULoQgUsplByapZP3DMNGbbEAV2dKRIM8c0yqdiC5v8=;
 b=zm9ao1smSNr3qWo9zha6asmVCfCm4hK+vH0q/Zu5CKg957wmWQxRRQUk7k+c1pURkYjL
 p65xCblUIPKErA+yhFy900U1trraha2d6rXbjnFvqpwesVfxlLnsOLVAE8m3UonYFryk
 2N1nM6HTEreVtQMFPh6VWS1w1CbUIAlxgyXbzEIm75tnC+K6xcDvBPxOZQccwardL3DF
 APDwVO9aJhWCZDA0LJdeOWaXwmwLuzauhhdLB4Tt3StEFLm9QUE04qqQkleWU4CfL0AJ
 KTy0/SrDXwRzxiFkOBncIrUa56C+IX1zfMukflRaa6hmJwoRCqeJvSlwjOT672na+UqL qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 34t4rapvw6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Nov 2020 19:06:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGJ4UiF125700;
        Mon, 16 Nov 2020 19:06:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 34ts5v2m38-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 Nov 2020 19:06:39 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AGJ6awN014957;
        Mon, 16 Nov 2020 19:06:36 GMT
Received: from [10.98.138.28] (/10.98.138.28)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 16 Nov 2020 11:06:36 -0800
Subject: Re: [PATCH v2] soc: ti: pruss: Fix wrong check against
 *get_match_data return value
To:     Suman Anna <s-anna@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        ssantosh@kernel.org
Cc:     lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com,
        Wei Yongjun <weiyongjun1@huawei.com>
References: <20201116172233.18459-1-grzegorz.jaszczyk@linaro.org>
 <7a18452c-8c9c-df7d-b175-529ab690623f@ti.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <528e56d5-23d5-9f83-1bf4-a7f786593eae@oracle.com>
Date:   Mon, 16 Nov 2020 11:06:34 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7a18452c-8c9c-df7d-b175-529ab690623f@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160113
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/16/20 9:31 AM, Suman Anna wrote:
> Hi Santosh,
> 
> On 11/16/20 11:22 AM, Grzegorz Jaszczyk wrote:
>> Since the of_device_get_match_data() doesn't return error code, remove
>> wrong IS_ERR test. Proper check against NULL pointer is already done
>> later before usage: if (data && data->...).
>>
>> Additionally, proceeding with empty device data is valid (e.g. in case
>> of "ti,am3356-pruss").
>>
>> Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
>> Reported-by: Wei Yongjun <weiyongjun1@huawei.com>
>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>> Acked-by: Suman Anna <s-anna@ti.com>
> 
> Can you please pick this up for 5.10-rc's?
> 
Nothing is broken so I will just add these for next merge window.

Regards,
Santosh
