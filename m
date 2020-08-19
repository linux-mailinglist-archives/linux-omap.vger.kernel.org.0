Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C78F24A4E1
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 19:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHSRXz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Aug 2020 13:23:55 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38602 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgHSRXy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Aug 2020 13:23:54 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07JHD3tL005151;
        Wed, 19 Aug 2020 17:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=oo8HJPOFnI8jYMf22UYgSVQCSYKNPPazecoW3XTuh6E=;
 b=nJoK3HvSvLS9hkuz5yxZGUO3oabzdeV8TRP8UMs+uFfNBfr6Ea1NlREW/FXLqVRRW+r1
 3wpJdqut57L4RIYiUzWF4Pu5UyDSZOYJOCg4RVyiURObIUQe54okMzXt16nZAxQIgfwu
 NFuN1yVUZSBanrPFcTAw79Eu7hQAHBrdEHaX9TgOmUVCUbYWnlkJOLiWoOAuPub8xPGV
 6h8KNtVAx3Ev7V0o8pvWjPGooz9tOPAgN+zkNwFwXe3uiLv/Ur/yKFz0sET3VtOy6zTo
 DqBTL+XYSEOTw8mjeG3rf4fEu7fIDguFdsGOcTS2P1Fxk9HUefEB48u01QAvGnO7Qy87 0g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 32x8bnbt9y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Aug 2020 17:23:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07JHCLIv112642;
        Wed, 19 Aug 2020 17:21:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 32xs9pgyps-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 Aug 2020 17:21:38 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07JHLaV6000771;
        Wed, 19 Aug 2020 17:21:37 GMT
Received: from [10.74.109.231] (/10.74.109.231)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 19 Aug 2020 10:21:35 -0700
Subject: Re: [PATCH 0/3] Simplify PM for am3/4, drop RTC pdata for am3/4/dra7
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>
References: <20200703160731.53698-1-tony@atomide.com>
 <20200818082953.GN2994@atomide.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <aaf8a24c-d12c-c3b2-6cd1-b9825d14e7a0@oracle.com>
Date:   Wed, 19 Aug 2020 10:21:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200818082953.GN2994@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9718 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190143
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9718 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190143
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 8/18/20 1:29 AM, Tony Lindgren wrote:
> Hi Santosh,
> 
> * Tony Lindgren <tony@atomide.com> [200703 19:08]:
>> Hi all,
>>
>> Here are patches to simplify the RTC+DDR PM code for am3 and am4. We want
>> to do this to drop the RTC related legacy platform data for am3 and am4.
>> We also drop RTC legacy platform data for dra7.
>>
>> Please test the RTC+DDR suspend on am437x-gp-evm if possible. I've tested
>> this series on am437x-sk-evm, but at least currently cannot do RTC+DDR
>> suspend and is limited to testing retention suspend only.
>>
>> These patches depend on v5.8-rc3 for earlier suspend and resume related
>> fixes.
>>
>> Additionally, for testing the LCD for suspend, the following patch is
>> needed for the missing omapdrm PM ops:
>>
>> drm/omap: force runtime PM suspend on system suspend
> 
> Here's another series that was getting too late for v5.9 that I'd like to
> queue for v5.10. Care to take a look and ack if it looks OK?
> 
Just finished going through the patches. If the suspend continue to work
with this update then its good to go.

FWIW,
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
