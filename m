Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7520D1376
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 18:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731709AbfJIQCA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 12:02:00 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43096 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730503AbfJIQCA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 12:02:00 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99Fj1pa166135;
        Wed, 9 Oct 2019 16:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=K/UuWzGfUxMEM2oiMN02pZdi5bJGDtU7WGVuefuYem4=;
 b=CjiE7xHMt8aGZBu/BzCRR83hbKS+f3GcfhOM51quBklix4eKzhrztWbC78hJsVwkwXr5
 swHQEmnKKS1oLi+zH33vvjvkA5zENxqvvfTQeL9G171JC0S9jl2DqYH4M5udlNxYjjp8
 r5A+YR04MqW7qMZay2XRj3BwHFroFWT+vSpoQdEqAhRwg2NPc7V7OizjcWPrxKJsc8md
 BxemalTKn467s7avMBvHNjeFxnmwwtSVOokBYU1vhVBW4XZiaaA2KZUqi13zw2RGYs9U
 c1Qi4wLIT3M5Vb8Z5V764bsMXH5UucWxf0HtbpKDGb2F1eHJdlTDZyMwWNR+XT2NpXyJ nQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2vektrnfb1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Oct 2019 16:01:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99Fhg44160795;
        Wed, 9 Oct 2019 16:01:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2vh8k11mk5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Oct 2019 16:01:45 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x99G1iUu027139;
        Wed, 9 Oct 2019 16:01:44 GMT
Received: from dhcp-10-159-237-174.vpn.oracle.com (/10.159.237.174)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Oct 2019 09:01:44 -0700
Subject: Re: [PATCHv8 0/9] soc: ti: add OMAP PRM driver (for reset)
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, ssantosh@kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de
References: <20191008125544.20679-1-t-kristo@ti.com>
 <20191008140002.GY5610@atomide.com>
From:   "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Organization: Oracle Corporation
Message-ID: <5e10f95c-7ec9-d3a7-6862-f6f07a9c1495@oracle.com>
Date:   Wed, 9 Oct 2019 09:01:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008140002.GY5610@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=4 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=831
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910090144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=911 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910090144
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/8/19 7:00 AM, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [191008 05:56]:
>> Hi,
>>
>> Hopefully this is the final revision of the series. Just a repost of v7
>> with the single comment from Philipp fixed, and added reviewed by tags
>> from him for couple of the patches.
> 
> Santosh, when applying these, can you please provide me an immutable
> branch maybe against v5.4-rc1 that I can use as the base for the related
> dts changes?
> 
> For the whole series where not already done, please feel free to add:
> 
> Reviewed-by: Tony Lindgren <tony@atomide.com>
> 
Pushed a branch out with series and your reviewed-by tag. I have tagged
it yet in case Peter's soc patches get ready.

git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git 
for_5.5/driver-soc
