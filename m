Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED323423763
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 07:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhJFFJn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 01:09:43 -0400
Received: from muru.com ([72.249.23.125]:41204 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhJFFJn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 01:09:43 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BEFC480E1;
        Wed,  6 Oct 2021 05:08:21 +0000 (UTC)
Date:   Wed, 6 Oct 2021 08:07:49 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap3430-sdp: Fix NAND device node
Message-ID: <YV0vJcH6jJL0x11p@atomide.com>
References: <20210902095828.16788-1-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902095828.16788-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Roger Quadros <rogerq@kernel.org> [210902 12:58]:
> Nand is on CS1 so reg properties first field should be 1 not 0.
> 
> Fixes: 44e4716499b8 ("ARM: dts: omap3: Fix NAND device nodes")

Thanks applying into fixes.

Tony
