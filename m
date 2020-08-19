Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8FA2496FC
	for <lists+linux-omap@lfdr.de>; Wed, 19 Aug 2020 09:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgHSHTy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Aug 2020 03:19:54 -0400
Received: from muru.com ([72.249.23.125]:40932 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726723AbgHSHTx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Aug 2020 03:19:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B22DB807A;
        Wed, 19 Aug 2020 07:19:52 +0000 (UTC)
Date:   Wed, 19 Aug 2020 10:20:20 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     rnayak@codeaurora.org, paul@pwsan.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH for v5.9] ARM: OMAP2+: PRM: Replace HTTP links with HTTPS
 ones
Message-ID: <20200819072020.GX2994@atomide.com>
References: <20200719084844.57001-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719084844.57001-1-grandmaster@al2klimov.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Alexander A. Klimov <grandmaster@al2klimov.de> [200719 11:48]:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.

Thanks applying into omap-for-v5.10/soc.

Tony
