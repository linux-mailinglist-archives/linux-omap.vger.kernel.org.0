Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E9F23E776
	for <lists+linux-omap@lfdr.de>; Fri,  7 Aug 2020 08:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgHGGyS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Aug 2020 02:54:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33368 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgHGGyS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Aug 2020 02:54:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0776rnW2127527;
        Fri, 7 Aug 2020 01:53:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596783229;
        bh=H8Fcq9JgY7I574mXCNx2xPhMfMGPrsM0PbRE3Vkkm0Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=q1F/m2xvdjOtiiyR4Zb9Any9X9vOPPVYxbvRIc1sv1N/QS75VEHZUImAwKAJcD9j/
         LWCKetZcfNVxv+zTis8ibVG99ju/LgLFH71o05FACqx2tN6JA4UKahjEYChPwJ1Zoc
         FESj1pdZf+fNz67lrIv+lY/Yvrce7GUaCfd3/K4I=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0776rncO092793;
        Fri, 7 Aug 2020 01:53:49 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 7 Aug
 2020 01:53:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 7 Aug 2020 01:53:49 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0776rlnG100098;
        Fri, 7 Aug 2020 01:53:47 -0500
Subject: Re: [Letux-kernel] module_mipi_dsi_driver panel with omapdrm?
To:     David Shah <dave@ds0.me>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, <kernel@pyra-handheld.com>
References: <20200706143613.GS37466@atomide.com>
 <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
 <20200707180115.GB5849@atomide.com>
 <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
 <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
 <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
 <20200724012411.GJ21353@pendragon.ideasonboard.com>
 <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
 <20200801232259.hitcfosiq6f2i57y@earth.universe>
 <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com>
 <20200805112831.akufm5wxkwqehiff@earth.universe>
 <0DDD1D3E-4F63-44B4-91CA-1B5B853837BC@goldelico.com>
 <64416676-a2ea-f11e-4d07-51a3efb55cdd@ti.com>
 <7ef4e081c1a0db81fd98f9e94afc6228a9b68703.camel@ds0.me>
 <1ec9febeb685c7fa866b14b0a4c2a5026f0a3461.camel@ds0.me>
 <63501267004c35bd1dc6971cb9cddda07c967303.camel@ds0.me>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8c46fc9f-833e-bdf6-3702-20cccc8145c7@ti.com>
Date:   Fri, 7 Aug 2020 09:53:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <63501267004c35bd1dc6971cb9cddda07c967303.camel@ds0.me>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

On 06/08/2020 21:44, David Shah wrote:
> Following a bit of testing, the DSI issues are fixed by 
> https://github.com/daveshah1/pyra-kernel-devel/commit/3161275854a0f2cd44a55b8eb039bd201f894486
>  (I will prepare a proper patch set shortly). This makes the display
> work with HDMI disabled.

Good catch, looks like a correct fix.

> There also seems to be a race condition between the hdmi0 connector
> and tpd12s015 "encoder". This results in the tpd12s015 permanently
> returning EPROBE_DEFER and the display subsystem never successfully
> probing.
> 
> Reversing the order of the encoder and connector in the device tree
> (omap5-board-common.dtsi) makes the display work again with HDMI
> enabled; as does adding some printks to the display-connector driver.

Ok, interesting... I was trying to boot up my omap5 uevm, but it halts during the boot, last print
being "palmas 0-0048: Irq flag is 0x00000008".

I'll try some other boards which have similar HDMI setup to see if I can reproduce.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
