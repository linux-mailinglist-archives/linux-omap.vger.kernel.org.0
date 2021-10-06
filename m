Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2520423927
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 09:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237610AbhJFHsz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 03:48:55 -0400
Received: from muru.com ([72.249.23.125]:41384 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237470AbhJFHsz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 03:48:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7EA4280E7;
        Wed,  6 Oct 2021 07:47:33 +0000 (UTC)
Date:   Wed, 6 Oct 2021 10:47:01 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gowtham Tammana <g-tammana@ti.com>,
        Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: dra7: add entry for bb2d module
Message-ID: <YV1UdSVOrZ3B9pq/@atomide.com>
References: <20210921071807.30978-1-narmstrong@baylibre.com>
 <20210921071807.30978-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921071807.30978-2-narmstrong@baylibre.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Neil Armstrong <narmstrong@baylibre.com> [210921 10:18]:
> From: Gowtham Tammana <g-tammana@ti.com>
> 
> BB2D is a Vivante GC 2D Accelerator.
> This adds the node to the dts file within a target module node.
> Crossbar index number is used for interrupt mapping.

Thanks applying into omap-for-v5.16/dt.

Tony
