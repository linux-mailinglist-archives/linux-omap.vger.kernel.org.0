Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC3339A8E
	for <lists+linux-omap@lfdr.de>; Sat,  8 Jun 2019 05:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbfFHD4i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Jun 2019 23:56:38 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53050 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730445AbfFHD4i (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Jun 2019 23:56:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x583uauE087580;
        Fri, 7 Jun 2019 22:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559966196;
        bh=xApOPbaphWPzxJKeQBh1cTOQCKroY+KpTKbui6gP1u0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sHErhbm31wd1mMeI6q39S/hwgyi5oGATYBqAjIu1ZeM5jj3cFF9w1QZoxonsrao9D
         rEf7HM3GYAp3iGdvEIVRt5GWgu5B64RSUcQwcEH1nuBEP52qiyqFAKsl8q3dIlN6ts
         H+JM9j7tlKAScZAM6N0uxJBsQU1xCVD3JzeoE+yY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x583uaUE061427
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 Jun 2019 22:56:36 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 22:56:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 22:56:35 -0500
Received: from [172.22.216.123] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x583uW8K064766;
        Fri, 7 Jun 2019 22:56:33 -0500
Subject: Re: [PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561 regulator
 support
To:     Mark Brown <broonie@kernel.org>
CC:     <lee.jones@linaro.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>
References: <20190516043218.8222-1-j-keerthy@ti.com>
 <20190516043218.8222-4-j-keerthy@ti.com>
 <20190522153528.GG8582@sirena.org.uk>
 <1712197d-7d43-38a8-efde-11b99537eae9@ti.com>
 <20190528132755.GK2456@sirena.org.uk>
From:   keerthy <j-keerthy@ti.com>
Message-ID: <e68d9939-a56a-b3c5-7f6d-e5783e16a6de@ti.com>
Date:   Sat, 8 Jun 2019 09:26:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528132755.GK2456@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 5/28/2019 6:57 PM, Mark Brown wrote:
> On Tue, May 28, 2019 at 03:23:41PM +0530, Keerthy wrote:
>> On 22/05/19 9:05 PM, Mark Brown wrote:
>>> On Thu, May 16, 2019 at 10:02:18AM +0530, Keerthy wrote:
> 
>>> Acked-by: Mark Brown <broonie@kernel.org>
> 
>> This patch will come via the mfd branch?
> 
> I'd expect so, IIRC it had a build dependency on the earlier patches in
> the series so if that doesn't happen I'll need to merge the relevant MFD
> commits.

Mark,

mfd patches are on linux-next already. Hope you can pull this one now 
that dependencies are met.

- Keerthy
> 
