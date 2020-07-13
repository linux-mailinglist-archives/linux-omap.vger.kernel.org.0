Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C65B21DF9F
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jul 2020 20:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgGMS06 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 14:26:58 -0400
Received: from muru.com ([72.249.23.125]:36754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726058AbgGMS06 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jul 2020 14:26:58 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 018098106;
        Mon, 13 Jul 2020 18:26:54 +0000 (UTC)
Date:   Mon, 13 Jul 2020 11:26:52 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: OMAP DEVICE TREE
 SUPPORT
Message-ID: <20200713182652.GR5849@atomide.com>
References: <20200708093451.13623-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708093451.13623-1-grandmaster@al2klimov.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Alexander A. Klimov <grandmaster@al2klimov.de> [200708 02:35]:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
...
>  If you apply the patch, please let me know.

I'm applying this into omap-for-v5.9/dt thanks.

Tony
