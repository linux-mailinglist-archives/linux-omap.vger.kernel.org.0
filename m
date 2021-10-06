Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AD04238C5
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 09:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhJFHZx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 03:25:53 -0400
Received: from muru.com ([72.249.23.125]:41298 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229861AbhJFHZx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 03:25:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7F94180E7;
        Wed,  6 Oct 2021 07:24:31 +0000 (UTC)
Date:   Wed, 6 Oct 2021 10:23:59 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     paul@pwsan.com, bcousson@baylibre.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Fix typo in some comments
Message-ID: <YV1PDy61424n4gFs@atomide.com>
References: <20210824120123.10899-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824120123.10899-1-wangborong@cdjrlc.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jason Wang <wangborong@cdjrlc.com> [210824 15:04]:
> The double `the' in comment "get a struct clk * for the the hwmod's ..."
> is repeated. Therefore, we should remove one of them from the comments.

Thanks applying into omap-for-v5.16/soc.

Tony
