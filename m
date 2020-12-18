Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20DF2DDEEC
	for <lists+linux-omap@lfdr.de>; Fri, 18 Dec 2020 08:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732600AbgLRHO6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Dec 2020 02:14:58 -0500
Received: from muru.com ([72.249.23.125]:39386 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726789AbgLRHO6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Dec 2020 02:14:58 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 75770809F;
        Fri, 18 Dec 2020 07:14:20 +0000 (UTC)
Date:   Fri, 18 Dec 2020 09:14:14 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP1: OSK: fix ohci-omap breakage
Message-ID: <20201218071414.GE26857@atomide.com>
References: <20201214210121.22042-1-aaro.koskinen@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214210121.22042-1-aaro.koskinen@iki.fi>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Aaro Koskinen <aaro.koskinen@iki.fi> [201214 23:01]:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> Commit 45c5775460f3 ("usb: ohci-omap: Fix descriptor conversion") tried to
> fix all issues related to ohci-omap descriptor conversion, but a wrong
> patch was applied, and one needed change to the OSK board file is still
> missing. Fix that.

Thanks applying into fixes.

Tony
