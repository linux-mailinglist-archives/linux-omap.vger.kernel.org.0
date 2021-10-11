Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AACD42867D
	for <lists+linux-omap@lfdr.de>; Mon, 11 Oct 2021 07:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhJKFzw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Oct 2021 01:55:52 -0400
Received: from muru.com ([72.249.23.125]:43242 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230102AbhJKFzw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Oct 2021 01:55:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B4D7C805F;
        Mon, 11 Oct 2021 05:54:23 +0000 (UTC)
Date:   Mon, 11 Oct 2021 08:53:50 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Roger Quadros <rogerq@kernel.org>,
        =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
        robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        nsekhar@ti.com, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
Message-ID: <YWPRbmaJQN85wRIO@atomide.com>
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
 <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
 <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> [211009 14:56]:
> On 08/10/2021 21:10, Roger Quadros wrote:
> > Krzysztof,
> > 
> > On 07/10/2021 20:37, Krzysztof Kozlowski wrote:
> >> On 07/10/2021 14:08, Roger Quadros wrote:
> >>> Hi,
> >>>
> >>> This series converts ti,gpmc memory controller and ti,gpmc-nand and
> >>> ti,gpmc-onenand MTD controller bindings to yaml.
> >>>
> >>> cheers,
> >>> -roger
> >>>
> >>
> >> Hi,
> >>
> >> Although you did not mention it here, it looks like you have some
> >> dependencies between the patches. Maybe this shall go simply via Rob's tree?
> >>
> > 
> > Rob has acked all the DT binding patches.
> > So it is upto you and Miquèl to decide the best way. MTD tree or Memory controller tree
> > for the dt-bindings patches.
> > 
> > The ARM: dts changes should go via Tony's OMAP SoC tree.
> > 
> > Or if Tony is OK with it then maybe all patches can go via Tony's tree? :)
> > 
> 
> 
> I reviewed the two memory-controller patches, so feel free to take them
> via MTD or OMAP SoC.

Sounds like I should pick up these because of the dts changes.

Thanks,

Tony
