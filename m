Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAF2D422EB
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 12:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438020AbfFLKqW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 06:46:22 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45926 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407373AbfFLKqW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 06:46:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CAkKJ3043859;
        Wed, 12 Jun 2019 05:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560336380;
        bh=rCT9l5IB5WSu/R5x7AxJQaWq6nyaViKh5rnaJFmCr/M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cYE4SOdVysL5JEHSNnno25M76Oa5XuwIig9vWinB4Gj4JLeuOnQ9fvGspfoOzSEv3
         9zVhGYLfBmdovfjOdbN2A61xDw6XepUPq/st9Sb32JLfda2wXsNgrqBcjoVXOLWTAD
         ycqlBkrNzycWaIyAOP1O53gLrmGEfcjOTvqpnBkY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CAkKS4057190
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Jun 2019 05:46:20 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 05:46:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 05:46:20 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CAkHX3058786;
        Wed, 12 Jun 2019 05:46:18 -0500
Subject: Re: [PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561 regulator
 support
To:     Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>
CC:     <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>
References: <20190516043218.8222-1-j-keerthy@ti.com>
 <20190516043218.8222-4-j-keerthy@ti.com>
 <20190522153528.GG8582@sirena.org.uk>
 <1712197d-7d43-38a8-efde-11b99537eae9@ti.com>
 <20190528132755.GK2456@sirena.org.uk>
 <e68d9939-a56a-b3c5-7f6d-e5783e16a6de@ti.com>
 <20190608195159.GA5316@sirena.org.uk> <20190610054822.GE4797@dell>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <c58ef6cd-893e-c20f-f437-e0343aa83fea@ti.com>
Date:   Wed, 12 Jun 2019 16:17:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610054822.GE4797@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/06/19 11:18 AM, Lee Jones wrote:
> On Sat, 08 Jun 2019, Mark Brown wrote:
> 
>> On Sat, Jun 08, 2019 at 09:26:31AM +0530, keerthy wrote:
>>
>>> mfd patches are on linux-next already. Hope you can pull this one now that
>>> dependencies are met.
>>
>> Someone will need to send me a copy of the patch, if I acked it I was
>> expecting it to go in with the MFD changes.
> 
> There is/was no need for that.  Patches are built-time orthogonal.

Sorry i am still not clear. Should i resend this patch?

> 
