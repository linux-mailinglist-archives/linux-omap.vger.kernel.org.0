Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55866428AC4
	for <lists+linux-omap@lfdr.de>; Mon, 11 Oct 2021 12:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbhJKKdj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Oct 2021 06:33:39 -0400
Received: from muru.com ([72.249.23.125]:43318 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235602AbhJKKdi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Oct 2021 06:33:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2D2568061;
        Mon, 11 Oct 2021 10:32:09 +0000 (UTC)
Date:   Mon, 11 Oct 2021 13:31:36 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
        robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        nsekhar@ti.com, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
Message-ID: <YWQSiNX/bBKcdTl2@atomide.com>
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
 <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
 <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
 <YWPRbmaJQN85wRIO@atomide.com>
 <f2125e81-07da-92ea-899a-d06ecae1919f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2125e81-07da-92ea-899a-d06ecae1919f@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Roger Quadros <rogerq@kernel.org> [211011 07:04]:
> Hi Tony,
> 
> On 11/10/2021 08:53, Tony Lindgren wrote:
> > * Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> [211009 14:56]:
> >> On 08/10/2021 21:10, Roger Quadros wrote:
> >>> Krzysztof,
> >>>
> >>> On 07/10/2021 20:37, Krzysztof Kozlowski wrote:
> >>>> On 07/10/2021 14:08, Roger Quadros wrote:
> >>>>> Hi,
> >>>>>
> >>>>> This series converts ti,gpmc memory controller and ti,gpmc-nand and
> >>>>> ti,gpmc-onenand MTD controller bindings to yaml.
> >>>>>
> >>>>> cheers,
> >>>>> -roger
> >>>>>
> >>>>
> >>>> Hi,
> >>>>
> >>>> Although you did not mention it here, it looks like you have some
> >>>> dependencies between the patches. Maybe this shall go simply via Rob's tree?
> >>>>
> >>>
> >>> Rob has acked all the DT binding patches.
> >>> So it is upto you and Miquèl to decide the best way. MTD tree or Memory controller tree
> >>> for the dt-bindings patches.
> >>>
> >>> The ARM: dts changes should go via Tony's OMAP SoC tree.
> >>>
> >>> Or if Tony is OK with it then maybe all patches can go via Tony's tree? :)
> >>>
> >>
> >>
> >> I reviewed the two memory-controller patches, so feel free to take them
> >> via MTD or OMAP SoC.
> > 
> > Sounds like I should pick up these because of the dts changes.
> 
> There is no dependency with the dts patches but it would be great if you can pick them all up.

OK all pushed out now to omap-for-v5.16/gpmc.

Thanks,

Tony
