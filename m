Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D120A303B64
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 12:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392121AbhAZLUM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 06:20:12 -0500
Received: from muru.com ([72.249.23.125]:53214 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392267AbhAZLUA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 06:20:00 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2F0C08057;
        Tue, 26 Jan 2021 11:19:24 +0000 (UTC)
Date:   Tue, 26 Jan 2021 13:19:17 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH  v3 1/1] ARM: dts: omap443x: Correct sgx clock to
 307.2MHz as used on motorola vendor kernel
Message-ID: <YA/6taDx1idpnWeG@atomide.com>
References: <20210104205631.5db65991237a872b6525ed65@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104205631.5db65991237a872b6525ed65@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Carl Philipp Klemm <philipp@uvos.xyz> [210104 21:57]:
> The Android vendor kernel uses 307.2MHz or a divider ratio of /5 while active 
> 153600000 or /10 is only used when the sgx core is inactive.

Applying into omap-for-v5.12/dt thanks.

Tony
