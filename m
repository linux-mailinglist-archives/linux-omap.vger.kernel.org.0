Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E2A447E9
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 19:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388320AbfFMRCw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 13:02:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36640 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732955AbfFMRCv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Jun 2019 13:02:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5DH2nWv085847;
        Thu, 13 Jun 2019 12:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560445369;
        bh=a/fwfBr6/AiPek9tHmowXu1EXqMUlQqdpcIOL2R9TwY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YNLAf6UIWzdF3bIacyBi5wXFtVplr+AjB7BPP4mX03dgESXPzHFJfGFfUPd3XyRR9
         +70ckwauXLQz3zBQVWnf7wlVMqyriO6sZbaLMlEknTb4khJJuLGPbgYlXBHmdHuAcX
         g/zKznTPgILp4E8e+6zlVpf+9S3GxB4UT95TY8DI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5DH2ngk103699
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 13 Jun 2019 12:02:49 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 13
 Jun 2019 12:02:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 13 Jun 2019 12:02:48 -0500
Received: from [172.22.216.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5DH2kRH054812;
        Thu, 13 Jun 2019 12:02:47 -0500
Subject: Re: [RESEND PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561
 regulator support
To:     Mark Brown <broonie@kernel.org>
CC:     <lee.jones@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>
References: <20190612144620.28331-1-j-keerthy@ti.com>
 <20190613154552.GL5316@sirena.org.uk>
From:   keerthy <j-keerthy@ti.com>
Message-ID: <bfb19336-fbe9-06d8-25d3-f2e0b8ea6c9b@ti.com>
Date:   Thu, 13 Jun 2019 22:32:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613154552.GL5316@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 6/13/2019 9:15 PM, Mark Brown wrote:
> On Wed, Jun 12, 2019 at 08:16:20PM +0530, Keerthy wrote:
> 
>> patches 1/3 2/3 are already applied to linux-next.
> 
> This doesn't build without those patches:

They are already on next. Do you want me to resend them as well?

> 
>    CC      drivers/regulator/lp87565-regulator.o
> drivers/regulator/lp87565-regulator.c:156:32: error: ‘LP87565_BUCK_3210’ undeclared here (not in a function); did you mean ‘LP87565_BUCK_10’?
>    LP87565_REGULATOR("BUCK3210", LP87565_BUCK_3210, "buck3210",
>                                  ^~~~~~~~~~~~~~~~~
> 
