Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78EE623BA96
	for <lists+linux-omap@lfdr.de>; Tue,  4 Aug 2020 14:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgHDMnd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Aug 2020 08:43:33 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34188 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgHDMnb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Aug 2020 08:43:31 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 074Ch8LF070948;
        Tue, 4 Aug 2020 07:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596544988;
        bh=Fguzuuu0jRu6YBNlvQybzi5mD4qlGAz2PdswFsHHyMA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=m37UpEgfU1I/whlh7Zii3qGIKsWhO0ZYnz88BR82Cmb8HSM1ofZkF35mMwPn14G7G
         wI4cMb+0AXxH7l6hqtkI/th8GJzSv6YfCSX4o/iyFuBb9PC87FWZajCWK7qZwdBrlD
         lAqxYG7U9jvL8q/HsFeQTfN2AJQizeD4fuxziofE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 074Ch8Ym105674
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Aug 2020 07:43:08 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 4 Aug
 2020 07:43:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 4 Aug 2020 07:43:07 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 074Ch5R6003946;
        Tue, 4 Aug 2020 07:43:06 -0500
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, <kernel@pyra-handheld.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com>
 <20200705142653.GQ37466@atomide.com> <20200705143614.GR37466@atomide.com>
 <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com>
 <20200706143613.GS37466@atomide.com>
 <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
 <20200707180115.GB5849@atomide.com>
 <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
 <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
 <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
 <20200724012411.GJ21353@pendragon.ideasonboard.com>
 <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e4caecb9-59d9-942c-0996-5906617d2604@ti.com>
Date:   Tue, 4 Aug 2020 15:43:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 01/08/2020 16:43, H. Nikolaus Schaller wrote:

> Fortunately David did fix the broken "reboot" for OMAP5 (when using timer8).
> Now I could run an unattended bisect session for the MIPI DSI panel driver
> to find as the first bad commit:
> 
> commit e7e67d9a2f1dd2f938adcc219b3769f5cc3f0df7
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Wed Feb 26 13:24:59 2020 +0200
> 
>    drm/omap: Switch the HDMI and VENC outputs to drm_bridge
> 
> This was merged through v5.7-rc1. The problem persists since then up
> to v5.8-rc7 and likely also to v5.9.
> 
> What I guess from the change hunks is that this is the critical one:
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
> index 9ba7cc8539a1..ce21c798cca6 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -60,6 +60,11 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>  	}
>  
>  	if (local_bridge) {
> +		if (!out->bridge) {
> +			ret = -EPROBE_DEFER;
> +			goto error;
> +		}
> +
>  		out->next_bridge = out->bridge;
>  		out->bridge = local_bridge;
>  	}
> 
> Since I have not seen a reference to an omap DSI bridge driver in upstream kernels
> I would assume that out->bridge is NULL and therefore probing is deferred forever
> and the old MIPI DSI driver (which is still there) is no longer operational.
> 
> This is consistent with that our (old omapdrm) panel driver is no longer probed.

What happens? Do you get any displays? Or no displays at all? Do you get an error print?

As Sebastian said, this shouldn't prevent DSI from probing. I don't see anything in the commit that
might affect DSI.

Does the board have other display outputs? HDMI? If yes, could you try with HDMI disabled, e.g. set
its status to "disabled" in the .dts.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
