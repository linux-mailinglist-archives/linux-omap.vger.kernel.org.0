Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D30159614
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 18:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgBKRW1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 12:22:27 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58140 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbgBKRW1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Feb 2020 12:22:27 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BHMHHh016490;
        Tue, 11 Feb 2020 11:22:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581441737;
        bh=Ciau4l7lH9ehGuqtt4pYzI7MkoU0dWlQUVaGwzDYBzo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OEhJ8oasBb5W0WCyLq/KycmJH/4M+nF/2rBw+X6G9OPoTkx+4XpsIUXuApZDzutx+
         pWvog7ugrfeBB5E2RrM3D//qi6gnuefSsPmljOgVwsKFglxW8NUMSGsd4Ev5uDEdfy
         G9D6OrCl/mITbVKlYrpLTbXFkXaW0mKkKYnv9a8o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BHMHL4084821
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Feb 2020 11:22:17 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 11:22:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 11:22:17 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BHMEkp130466;
        Tue, 11 Feb 2020 11:22:15 -0600
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
To:     Tony Lindgren <tony@atomide.com>
CC:     Merlijn Wajer <merlijn@wizzup.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Sebastian Reichel <sre@kernel.org>
References: <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
 <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
 <20200211110712.GB28355@pendragon.ideasonboard.com>
 <3b4d10c6-7cb2-af53-3a39-31eef441bfdd@ti.com>
 <98da360f-880b-af56-b285-4d9b39f8a342@wizzup.org>
 <20200211160524.GE64767@atomide.com>
 <87b1111e-af06-1e2a-8baa-c3f9a15f1874@ti.com>
 <20200211162719.GF64767@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d7e51d54-ffb3-2792-8bdb-73fc627fd675@ti.com>
Date:   Tue, 11 Feb 2020 19:22:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211162719.GF64767@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/02/2020 18:27, Tony Lindgren wrote:

>> We are still missing DSI command mode support, and moving it to the common DRM model.
> 
> Nope, DSI command mode support has been working just fine for
> a while now :) And Sebastian has a WIP git tree of the common DRM

Indeed... It had been going on for so long that now my mind is stuck at dsi-command-mode-not-yet-in =).

> model changes for it. I don't think we have devices with DSI
> command mode working for omapfb but not for omapdrm?

Yes, I think that is true.

> What got missed for v5.6-rc1 is the LCD backlight patch though,
> I think the only issue there is default-brightness vs more common
> default-brightness-value usage if you have any input to that.

At least for some boards a power supply is needed, and I think there was no conclusion on who should 
enable that. It didn't seem to fit in anywhere...

But need to check on the latest status. I wasn't following that work closely, as JJ was working on it.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
