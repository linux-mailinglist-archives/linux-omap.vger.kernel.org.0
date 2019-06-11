Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B139E3C45A
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2019 08:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391243AbfFKGhR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Jun 2019 02:37:17 -0400
Received: from muru.com ([72.249.23.125]:52720 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390485AbfFKGhQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 11 Jun 2019 02:37:16 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A221280C0;
        Tue, 11 Jun 2019 06:37:37 +0000 (UTC)
Date:   Mon, 10 Jun 2019 23:37:13 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] ARM: dts: Drop bogus CLKSEL for timer12 on dra7
Message-ID: <20190611063713.GA5447@atomide.com>
References: <20190530065635.42811-1-tony@atomide.com>
 <89884096-cda4-ea67-6776-4fb25abc65e3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89884096-cda4-ea67-6776-4fb25abc65e3@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [190531 12:06]:
> On 30/05/2019 09:56, Tony Lindgren wrote:
> > There is no CLKSEL for timer12 on dra6 unlike for timer1. This
> 
> dra7

Thanks for spotting the typo, pushed out now and will send
a pull request for the dra7 fixes probably on Wednesday.

Regards,

Tony
