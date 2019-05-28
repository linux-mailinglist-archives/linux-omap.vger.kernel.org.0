Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F3D2C392
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 11:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfE1JxG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 05:53:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35936 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfE1JxG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 05:53:06 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S9r47m076427;
        Tue, 28 May 2019 04:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559037184;
        bh=4KlLJZMai6Tue5hNTSfEh3SZddxM6vMHjrc4ER6gkbs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ifrXlRFWd/7sFDyJ/dN5TV/3/r5oYSwPEcX6jVbrBnQNEgq74+qucjVLdOX3OQM1e
         shu1Uw8xKrnAK4vCMX5GFCJ+ijWjIuDZ8GlhYOOiiPXevM4xASx7dng37XHc8QnuVZ
         Er6XI14LWH9zU2PbL4wm65CGCc9lSPiBvkdv4AHo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S9r402086991
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 04:53:04 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 04:53:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 04:53:04 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S9r1IY109231;
        Tue, 28 May 2019 04:53:02 -0500
Subject: Re: [PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561 regulator
 support
To:     Mark Brown <broonie@kernel.org>, <lee.jones@linaro.org>
CC:     <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>
References: <20190516043218.8222-1-j-keerthy@ti.com>
 <20190516043218.8222-4-j-keerthy@ti.com>
 <20190522153528.GG8582@sirena.org.uk>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <1712197d-7d43-38a8-efde-11b99537eae9@ti.com>
Date:   Tue, 28 May 2019 15:23:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522153528.GG8582@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 22/05/19 9:05 PM, Mark Brown wrote:
> On Thu, May 16, 2019 at 10:02:18AM +0530, Keerthy wrote:
>> The LP8756x family has a single output 4-phase regulator
>> configuration. Add support for the same. The control
>> lies in the master buck which is buck0 for 4-phase
>> configuration. Enable/disable/voltage set happen via
>> buck0 registers.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Mark/Lee,

This patch will come via the mfd branch?

- Keerthy

> 
