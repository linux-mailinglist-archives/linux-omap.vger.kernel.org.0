Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1309E2F505A
	for <lists+linux-omap@lfdr.de>; Wed, 13 Jan 2021 17:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbhAMQr4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Jan 2021 11:47:56 -0500
Received: from muru.com ([72.249.23.125]:44722 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727301AbhAMQr4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 Jan 2021 11:47:56 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B590A80A7;
        Wed, 13 Jan 2021 16:47:14 +0000 (UTC)
Date:   Wed, 13 Jan 2021 18:47:11 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3
 l4_wkup
Message-ID: <X/8kDzoADvcnNHxC@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
 <20201026112222.56894-14-tony@atomide.com>
 <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com>
 <X/8ei0o9ULpRdx7T@atomide.com>
 <CAMuHMdW+y5Y+0U1beebq7EGiarBKYdHszL+vW5r4xG6HBspVgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW+y5Y+0U1beebq7EGiarBKYdHszL+vW5r4xG6HBspVgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Geert Uytterhoeven <geert@linux-m68k.org> [210113 16:42]:
> On Wed, Jan 13, 2021 at 5:23 PM Tony Lindgren <tony@atomide.com> wrote:
> > Strange, bbb has been working for me with NFSroot, that's with
> > omap2plus_defconfig. Care to send your .config so I can give it a
> > try tomorrow?
> 
> Sent by private email.

OK thanks.

> Just tried omap2plus_defconfig, and it also hangs during boot.

Hmm OK. Will give it a try tomorrow.

Reegards,

Tony
