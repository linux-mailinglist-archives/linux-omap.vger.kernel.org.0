Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D522FC289
	for <lists+linux-omap@lfdr.de>; Tue, 19 Jan 2021 22:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391501AbhASRuR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Jan 2021 12:50:17 -0500
Received: from muru.com ([72.249.23.125]:55406 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387591AbhASPFD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Jan 2021 10:05:03 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D67F38027;
        Tue, 19 Jan 2021 15:03:55 +0000 (UTC)
Date:   Tue, 19 Jan 2021 17:03:51 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Subject: Re: [PATCHv2] drivers: bus: simple-pm-bus: Fix compatibility with
 simple-bus for auxdata
Message-ID: <YAb01wQvBg0vq0TO@atomide.com>
References: <20210118073340.62141-1-tony@atomide.com>
 <CAK8P3a1Eec1cAOdxNQ=8LORop+ESqx_=dg1uhJwpXhknxOydsg@mail.gmail.com>
 <YAVJyjmrbLCFjqVA@atomide.com>
 <CAL_JsqJWPc4rt0NiaF=zS0XOy4b8pZKDCEaxCjp8rW+joMjvjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJWPc4rt0NiaF=zS0XOy4b8pZKDCEaxCjp8rW+joMjvjQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh+dt@kernel.org> [210119 14:51]:
> On Mon, Jan 18, 2021 at 2:41 AM Tony Lindgren <tony@atomide.com> wrote:
> > - PRM power managment interrupts that also pinctrl driver uses
> 
> I haven't looked at it, but can't one driver go find the other node
> and the interrupts it needs? There's nothing wrong with a driver
> looking outside 'its node' for information.

Yes sure once there are interrupt nodes for it :) It should eventually
be a chained irqchip or something like that. FYI, the current stuff is
the code in mach-omap2/prm_common.c.

Regards,

Tony
