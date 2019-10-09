Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE1A9D1364
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 18:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730256AbfJIQAN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 12:00:13 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:40906 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbfJIQAN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 12:00:13 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99Fj0WF166043;
        Wed, 9 Oct 2019 15:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=6mYjeh1BvbejmJuHCOd/rUIq7PAiU1Dm3NqS1tETj+Q=;
 b=FULtrCUrQfndlQUizOQTKq2+KQN5KY8ZzSFfG4OjFqVPEbku+62mB2xYmBkTMNZ01Deg
 xSqq6qoVVPp3h/eDMpVN5mpHinPu2Ygj8T2R99noEVmi4J7rcX74SyM5WfC1URNFFTmj
 NaOXjpTxJuuEmuWRY8qwtS787LM6udM4xF1KB6OEkQa80V3EaRv84r7eT9v7JHECocP3
 7bDL8i9wVZzaDgXGIcTQjngt29VBjnYobAetk0UP07s7m5epq68aONGtd5waRELfRk/s
 +B1MDbk39p+f5PlEy3E9bHiiQhO4qv3sO9LjNGo9V5+d7R+jCGXkRYHVnbVVyLODVXSQ bQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2vektrnew7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Oct 2019 15:59:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99FhUr2114458;
        Wed, 9 Oct 2019 15:59:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2vgev1qbem-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Oct 2019 15:59:48 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x99FxjUn004979;
        Wed, 9 Oct 2019 15:59:46 GMT
Received: from dhcp-10-159-237-174.vpn.oracle.com (/10.159.237.174)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Oct 2019 08:59:45 -0700
Subject: Re: [PATCHv8 1/9] dt-bindings: omap: add new binding for PRM
 instances
To:     Tero Kristo <t-kristo@ti.com>, Sebastian Reichel <sre@kernel.org>
Cc:     linux-omap@vger.kernel.org, ssantosh@kernel.org, tony@atomide.com,
        s-anna@ti.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de
References: <20191008125544.20679-1-t-kristo@ti.com>
 <20191008125544.20679-2-t-kristo@ti.com>
 <20191008154655.u34wkbqgmelv3aea@earth.universe>
 <115ab938-e025-98fa-3b9e-0b3ced39307d@ti.com>
From:   "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Organization: Oracle Corporation
Message-ID: <dc2a9659-8593-e5d0-54b2-44d827e76759@oracle.com>
Date:   Wed, 9 Oct 2019 08:59:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <115ab938-e025-98fa-3b9e-0b3ced39307d@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=4 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=697
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910090144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=777 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910090144
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/8/19 11:52 PM, Tero Kristo wrote:
> On 08/10/2019 18:46, Sebastian Reichel wrote:
>> Hi,
>>
>> On Tue, Oct 08, 2019 at 03:55:36PM +0300, Tero Kristo wrote:
>>> +Example:
>>> +
>>> +prm_dsp2: prm@1b00 {
>>> +    compatible = "ti,omap-prm-inst", "ti,dra7-prm-inst";
>>
>> Nit: compatible values are sorted the other way around (most
>> specific first).
> 
> Hmm right, I would not like to re-post the whole series just for this 
> seeing all the acks are in place already.
> 
> Santosh, do you want to fix this locally or shall we post a separate 
> patch later on to fix this?
> 
No need. I fixed it up. Pls check.

git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git 
for_5.5/driver-soc

Regards,
Santosh
