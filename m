Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683483D70D0
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235902AbhG0IGu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:06:50 -0400
Received: from muru.com ([72.249.23.125]:55552 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235921AbhG0IGs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:06:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1D55580F0;
        Tue, 27 Jul 2021 08:06:55 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:06:36 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     linux-omap@vger.kernel.org, Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH] ARM: omap2+: hwmod: fix potential NULL pointer access
Message-ID: <YP++jO22vSMYEdqV@atomide.com>
References: <20210720184710.17726-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720184710.17726-1-khilman@baylibre.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kevin Hilman <khilman@baylibre.com> [210720 21:47]:
> From: Tero Kristo <t-kristo@ti.com>
> 
> omap_hwmod_get_pwrdm() may access a NULL clk_hw pointer in some failure
> cases. Add a check for the case and bail out gracely if this happens.

Applying into fixes thanks.

Tony
