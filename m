Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4BE21DF93
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jul 2020 20:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgGMSY6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 14:24:58 -0400
Received: from muru.com ([72.249.23.125]:36740 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbgGMSY6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jul 2020 14:24:58 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7FAA68106;
        Mon, 13 Jul 2020 18:24:55 +0000 (UTC)
Date:   Mon, 13 Jul 2020 11:24:54 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
Message-ID: <20200713182454.GQ5849@atomide.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200709 16:20]:
> Hi Tony,
> 
> The following series contains all the necessary DT pieces to boot the
> IPU and DSP remote processors on OMAP4 and OMAP5 SoCs. They are
> enabled specifically on the TI OMAP4 PandaBoard and OMAP5 uEVM boards.
> This is the last DT piece that now completes the support for IPUs and
> DSPs on all OMAP4+ SoCs, similar patches were merged for 5.8 covering
> the DRA7xx/AM57xx SoCs. Appreciate it if you can pick up the series for
> 5.9 if it isn't too late.

Applying the series into omap-for-v5.9/dt thanks.

Regards,

Tony
