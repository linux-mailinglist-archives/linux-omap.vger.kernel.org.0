Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD2E844A6D
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 20:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbfFMSKF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 14:10:05 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43520 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727203AbfFMSKD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Jun 2019 14:10:03 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5DIA1vi100822;
        Thu, 13 Jun 2019 13:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560449401;
        bh=Y4+K2Ii/3LdHFb7cPsa8bj2j7YViNwCxC73g7obaPGI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=iN0M3mVhc7mJQwiHtPFJ9mS3mUC72Qq26u/vZy+SxL10KN8tO9hrntjIUFc/TlilB
         KzyM0VmXo3znhaZnx1E5J3jcSHnlJ+TawVqgdIgz1d04S+ciyY62YtcGQwi+oYriPE
         Zc3C50eT0Q7dtO+YNJrPPry2MhZGYRsPg6upI3TE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5DIA1YS050562
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 13 Jun 2019 13:10:01 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 13
 Jun 2019 13:10:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 13 Jun 2019 13:10:01 -0500
Received: from [172.22.216.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5DI9uVb012725;
        Thu, 13 Jun 2019 13:09:57 -0500
Subject: Re: [RESEND PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561
 regulator support
To:     Mark Brown <broonie@kernel.org>
CC:     <lee.jones@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>
References: <20190612144620.28331-1-j-keerthy@ti.com>
 <20190613154552.GL5316@sirena.org.uk>
 <bfb19336-fbe9-06d8-25d3-f2e0b8ea6c9b@ti.com>
 <20190613173248.GP5316@sirena.org.uk>
From:   keerthy <j-keerthy@ti.com>
Message-ID: <7b500f5d-9ea0-0135-7174-b7a34db23d28@ti.com>
Date:   Thu, 13 Jun 2019 23:39:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613173248.GP5316@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 6/13/2019 11:02 PM, Mark Brown wrote:
> On Thu, Jun 13, 2019 at 10:32:45PM +0530, keerthy wrote:
>> On 6/13/2019 9:15 PM, Mark Brown wrote:
>>> On Wed, Jun 12, 2019 at 08:16:20PM +0530, Keerthy wrote:
> 
>>>> patches 1/3 2/3 are already applied to linux-next.
> 
>>> This doesn't build without those patches:
> 
>> They are already on next. Do you want me to resend them as well?
> 
> That's no good, it still breaks the build of my tree.  I can't apply
> this until the code is in my tree, either through a shared branch or
> through Lihus' tree.  I see I acked the patch, I'll have been expecting
> the patch to be applied to Lee's tree.  If that's not possible or
> there's no branch then please resend after the merge window.

Lee Jones,

Could you please pull this patch?

- Keerthy
> 
