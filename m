Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CAB3D713E
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235740AbhG0Icl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:32:41 -0400
Received: from muru.com ([72.249.23.125]:55616 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235629AbhG0Ick (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:32:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AB4D380F0;
        Tue, 27 Jul 2021 08:32:58 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:32:39 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/3] arm: omap2: Drop MACH_OMAP3517EVM entry
Message-ID: <YP/Epx04Za2wiSlt@atomide.com>
References: <20210613125105.786984-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613125105.786984-1-pbrobinson@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Robinson <pbrobinson@gmail.com> [210613 15:51]:
> The MACH_OMAP3517EVM was added back in commit 549f95ed2016 due to
> being used by the ASoC driver, but this driver was dropped in
> commit 2c2596f3ab25 as the audio for this board had been moved to
> a simple-audio-card configuration so MACH_OMAP3517EVM is now
> properly unuused and can be dropped.

Applying into omap-for-v5.15/soc thanks.

Tony
