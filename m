Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94FD7113C2D
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2019 08:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfLEHO0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Dec 2019 02:14:26 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57516 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfLEHO0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Dec 2019 02:14:26 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB57E1hv082932;
        Thu, 5 Dec 2019 01:14:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575530041;
        bh=dkFv6j9fRjqBhXFVZB7BZd45r5LtSIjtFSiHCS/++VY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=UqMx0a0ByuAq/T7JX8L+w97j1tm7X5NVg+1YJalkBUEUbCLT4LygU7Pytj38SjuWF
         ZO5n93XuCrvnaRyTlK9DMGVykq/G5COai3JAvg9k/DpvVVrHHS/E96vtj+Z6mCDpGt
         SgXd39XCKBCCu3A4s0037E+7qSb5+Yif+DU1o8sw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB57E0es097065;
        Thu, 5 Dec 2019 01:14:00 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 01:14:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Dec 2019 01:14:00 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB57Dvrb062767;
        Thu, 5 Dec 2019 01:13:57 -0600
Subject: Re: [PATCH 2/2] dt-bindings: display: Add obsolete note to
 "ti,tilcdc,panel" binding
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
CC:     dri-devel <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>, <sam@ravnborg.org>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <tomi.valkeinen@ti.com>,
        <laurent.pinchart@ideasonboard.com>, <peter.ujfalusi@ti.com>,
        <bparrot@ti.com>
References: <cover.1575481630.git.jsarha@ti.com>
 <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
 <55DCFF0C-E03E-44DA-A3BE-C81AA4D6782E@goldelico.com>
From:   Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c918d309-4a97-af0b-ef8c-4140b29327ee@ti.com>
Date:   Thu, 5 Dec 2019 09:13:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <55DCFF0C-E03E-44DA-A3BE-C81AA4D6782E@goldelico.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/12/2019 09:06, H. Nikolaus Schaller wrote:
> 
>> Am 04.12.2019 um 18:53 schrieb Jyri Sarha <jsarha@ti.com>:
>>
>> The "ti,tilcdc,panel" binding should not be used anymore, since tilcdc
>> is fully capable of using generic drm panels like panel-simple and
>> panel-common binding.
> 
> Is there an example how to convert?
> 
> As far as I can see all arch/arm/boot/dts/am335x-*.dts use "ti,tilcdc,panel"
> 
> arch/arm/boot/dts/am335x-evm.dts would IMHO be a good candidate.
> 

Yes, there is. Here are the patches to convert am335x-evm.dts and
am335x-evmsk.dts:

https://lists.freedesktop.org/archives/dri-devel/2019-December/247301.html
https://lists.freedesktop.org/archives/dri-devel/2019-December/247594.html

I would have added a reference to the note, but since the patches are
not yet queued to mainline, I decided against it.

The first thing to do before conversion is to check if panel-simple (or
some other generic drm panel driver) already supports the used panel. If
yes, then the conversion should be quite straight forwards. If not, then
the first thing to do is to add support for the used panel into
panel-simple.c.

Best regards,
Jyri


>> However, the obsolete binding is still widely
>> used in many mainline supported platforms that I do not have access to
>> and who knows how many custom platforms. So I am afraid we have to
>> keep the old bundled tilcdc panel driver around.
>>
>> Signed-off-by: Jyri Sarha <jsarha@ti.com>
>> ---
>> Documentation/devicetree/bindings/display/tilcdc/panel.txt | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
>> index 808216310ea2..54963f9173cc 100644
>> --- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
>> +++ b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
>> @@ -1,5 +1,11 @@
>> Device-Tree bindings for tilcdc DRM generic panel output driver
>>
>> +NOTE: This binding (and the related driver) is obsolete and should not
>> +      be used anymore. Please refer to drm panel-common binding (and
>> +      to a generic drm panel driver like panel-simple).
>> +      Documentation/devicetree/bindings/display/panel/panel-common.yaml
>> +      (drivers/gpu/drm/panel/panel-simple.c)
>> +
>> Required properties:
>>  - compatible: value should be "ti,tilcdc,panel".
>>  - panel-info: configuration info to configure LCDC correctly for the panel
>> -- 
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>
> 


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
