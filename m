Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BA823BA51
	for <lists+linux-omap@lfdr.de>; Tue,  4 Aug 2020 14:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgHDM25 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Aug 2020 08:28:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53614 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgHDM24 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Aug 2020 08:28:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 074CDuMw074502;
        Tue, 4 Aug 2020 07:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596543236;
        bh=JOfyqeir6ARFogRylpwG98UmFIW6NsPI8sn/W2c7nS8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hj7/DHXKrmzVI+81eoPWOx67pkrZ07i6xAfDurwE2vytkUnzGK9jL7UoZikxWfHHy
         671kzWzaLfE/0ARN2opsVHNIFrItvNQT9x7iomlTKSBWOLYEupGF0elk7zWidN6o8O
         mIX2RO/ePMFWeY1riI1da0xC3RFvJg7/0UbNrJZQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 074CDuTT086662
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Aug 2020 07:13:56 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 4 Aug
 2020 07:13:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 4 Aug 2020 07:13:55 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 074CDsOf094163;
        Tue, 4 Aug 2020 07:13:54 -0500
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
Date:   Tue, 4 Aug 2020 15:13:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28/07/2020 21:14, Aaro Koskinen wrote:
> Hi,
> 
> Looks like N900 display support has broken after v5.6.
> 
> When using v5.7, or the current mainline (v5.8-rc7), the boot hangs at:
> 
> [    6.269500] omapdss_dss 48050000.dss: 48050000.dss supply vdda_video not found, using dummy regulator
> [    6.321685] DSS: OMAP DSS rev 2.0
> [    6.328002] omapdss_dss 48050000.dss: bound 48050400.dispc (ops dispc_component_ops)
> [    6.336364] omapdss_dss 48050000.dss: bound 48050c00.encoder (ops venc_component_ops)
> [    6.345153] omapdrm omapdrm.0: DMM not available, disable DMM support
> [    6.352447] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> 
> with a blank display.
> 
> I tried to bisect this, and the first commit that breaks the display is:
> 
> 2f004792adadcf017fde50339b432a26039fff0c is the first bad commit
> commit 2f004792adadcf017fde50339b432a26039fff0c
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Wed Feb 26 13:24:57 2020 +0200
> 
>     drm/omap: venc: Register a drm_bridge
> 
> This commit does not yet hang the kernel, but the display is blank and
> the probe fails:
> 
> [    6.290100] omapdss_dss 48050000.dss: 48050000.dss supply vdda_video not foun
> d, using dummy regulator
> [    6.342346] DSS: OMAP DSS rev 2.0
> [    6.348663] omapdss_dss 48050000.dss: bound 48050400.dispc (ops dispc_component_ops)
> [    6.357025] omapdss_dss 48050000.dss: bound 48050c00.encoder (ops venc_component_ops)
> [    6.365814] omapdrm omapdrm.0: DMM not available, disable DMM support
> [    6.372863] omapdrm omapdrm.0: omap_modeset_init failed: ret=-22
> [    6.414611] omapdrm: probe of omapdrm.0 failed with error -22

Afaics, this is caused by the patch doing

	if (!venc->output.next_bridge)

instead of

	if (venc->output.next_bridge)

Fixing that removes the error on beagle xm, but for some reason I don't see TV-out as a DRM output
(but HDMI output works).

> The hang seems to start with this commit:
> 
> commit 8bef8a6d5da81b909a190822b96805a47348146f (HEAD -> master)
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Wed Feb 26 13:25:10 2020 +0200
> 
>     drm/omap: sdi: Register a drm_bridge
> 
> Confusingly, some of the commits between these two commits do provide a
> working display, e.g. 13d2d52f59c0c79398d9c9e2ea3d661a0e5b6bbc ("drm/omap:
> sdi: Sort includes alphabetically") works...

The venc issue is fixed in "Switch the HDMI and VENC outputs to drm_bridge", which is a few commits
after the "venc: Register a drm_bridge".

So I'm guessing SDI works until "sdi: Register a drm_bridge", but as omapdrm doesn't probe, you get
no displays.

Can you try to pinpoint a bit where the hang happens? Maybe add DRM/omapdrm debug prints, or perhaps
sysrq works and it shows a lock that's in deadlock.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
