Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3247DE08CE
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732463AbfJVQ2N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:28:13 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55748 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731132AbfJVQ2N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Oct 2019 12:28:13 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9MGS6XL109569;
        Tue, 22 Oct 2019 11:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571761686;
        bh=JvsTsVvNKyEdNQmcoKWgQZvfupVu9GC3u5TfI4yGQMM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=KTr54bVYexkynr4Z7RouTo4jQnbtq7sYxR+gez5C3vs0Jm8GQk/Q0Wm3uCtdw6HDI
         +ROp7ZMVE86dxBuEzDBRXUo+VDyjSGwaeIICLt0zaC6RLQjV63FKNLFetqvKRkJUn9
         +awYQorHoibayeRpqbUrO9EzfUfvqD9kD/1nv+Xs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9MGRpd0078602
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Oct 2019 11:27:51 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 22
 Oct 2019 11:27:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 22 Oct 2019 11:27:41 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x9MGRKBC082935;
        Tue, 22 Oct 2019 11:27:20 -0500
Date:   Tue, 22 Oct 2019 11:27:20 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 0/3] ARM: dts: dra7: add vpe nodes
Message-ID: <20191022162720.yile7i4qwxgbuuou@ti.com>
References: <20191009175628.20570-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191009175628.20570-1-bparrot@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony,

Ping,

I already had comments from Rob but i would like your feedback before
sending a v2.

Regards,
Benoit

Benoit Parrot <bparrot@ti.com> wrote on Wed [2019-Oct-09 12:56:25 -0500]:
> This patch series adds the needed clkctrl and ty-sysc nodes for VPE module.
> We also document the VPE DT bindings.
> 
> Benoit Parrot (3):
>   dt-bindings: media: ti-vpe: Document VPE driver
>   ARM: dts: dra7: add vpe clkctrl node
>   ARM: dts: dra7: Add ti-sysc node for VPE
> 
>  .../devicetree/bindings/media/ti-vpe.txt      | 48 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  arch/arm/boot/dts/dra7-l4.dtsi                | 30 ++++++++++--
>  arch/arm/boot/dts/dra7xx-clocks.dtsi          | 18 ++++++-
>  drivers/clk/ti/clk-7xx.c                      |  6 +++
>  include/dt-bindings/clock/dra7.h              | 10 ++++
>  6 files changed, 108 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/ti-vpe.txt
> 
> -- 
> 2.17.1
> 
