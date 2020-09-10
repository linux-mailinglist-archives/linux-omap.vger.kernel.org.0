Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315B026436E
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 12:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbgIJKNq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 06:13:46 -0400
Received: from muru.com ([72.249.23.125]:44534 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgIJKNp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 06:13:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8216D80F9;
        Thu, 10 Sep 2020 10:13:43 +0000 (UTC)
Date:   Thu, 10 Sep 2020 13:14:26 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     linux@armlinux.org.uk, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable twl4030_madc as a
 loadable module
Message-ID: <20200910101426.GF7101@atomide.com>
References: <20200819191524.32581-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819191524.32581-1-andreas@kemnade.info>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [200819 22:18]:
> The ADC is used by twl4030_charger to read voltages. If a dtb contains
> the ADC but the module is not build, probing twl4030_charger will be
> endlessly deferred, so just enable CONFIG_TWL4030_MADC in the config.

Thanks applying into omap-for-v5.10/defconfig.

Tony
