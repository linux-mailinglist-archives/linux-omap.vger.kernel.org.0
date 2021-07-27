Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396A43D7157
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235930AbhG0Imw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:42:52 -0400
Received: from muru.com ([72.249.23.125]:55646 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235629AbhG0Imw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:42:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EBD1380F0;
        Tue, 27 Jul 2021 08:43:09 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:42:50 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     linux-omap@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [PATCH] ARM: dts: Add support for dra762 abz package
Message-ID: <YP/HCiWEK2fH0/Na@atomide.com>
References: <20210715212024.35738-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715212024.35738-1-khilman@baylibre.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kevin Hilman <khilman@baylibre.com> [210716 00:20]:
> From: Lokesh Vutla <lokeshvutla@ti.com>
> 
> dra762 abz package is pin compatible with dra742 and few peripherals
> like DDR with upgraded speed. Add dt support for this SoC.

Thanks applying into omap-for-v5.15/dt.

Tony
