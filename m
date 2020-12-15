Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486552DADC0
	for <lists+linux-omap@lfdr.de>; Tue, 15 Dec 2020 14:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgLONIF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Dec 2020 08:08:05 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36616 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgLONH6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Dec 2020 08:07:58 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD6YZQ036237;
        Tue, 15 Dec 2020 07:06:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1608037594;
        bh=v+wfwR8MsifsGuoRp9WQUfmkznAVY28F5hPJ+pwwwPY=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=JWe5KjRBAcwxtlafH2+rIPtkiTbTg25Xcqf35/sROr6DRYkJZSu9uJaYsXSp3TmXm
         m5IHvsJoVt7UmGzHvKgAGxNuTre40Lq45tSWILMnoPE17fQtV9zpymWmz5vVtGtsM9
         U3f+XYHfl+z9/d1CgfPrj3L2RgaqWVoRLOHHdRno=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFD6YD9092758
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Dec 2020 07:06:34 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 07:06:33 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 07:06:33 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFD6UL7027914;
        Tue, 15 Dec 2020 07:06:31 -0600
Subject: Re: [PATCH 0/2] ASoC: ti: Maintainer mail address change
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <jarkko.nikula@bitmer.com>, <robh+dt@kernel.org>,
        <peter.ujfalusi@gmail.com>
CC:     <alsa-devel@alsa-project.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jsarha@ti.com>
References: <20201215130512.8753-1-peter.ujfalusi@ti.com>
Message-ID: <05baa6cf-9364-63e4-0bbe-a49ff2177941@ti.com>
Date:   Tue, 15 Dec 2020 15:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215130512.8753-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 15/12/2020 15.05, Peter Ujfalusi wrote:
> Hi,
> 
> My TI address is going to bounce after Friday (18.12.2020), switch my email
> address to my private one for now.

Obviously I forgot to 'TO' the private myself...

Doing that now.

> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (2):
>   MAINTAINERS: Update email address for TI ASoC and twl4030 codec
>     drivers
>   ASoC: dt-bindings: ti,j721e: Update maintainer and author information
> 
>  .../devicetree/bindings/sound/ti,j721e-cpb-audio.yaml       | 4 +++-
>  .../devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml   | 4 +++-
>  MAINTAINERS                                                 | 6 +++---
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
