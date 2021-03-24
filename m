Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B274C3477A8
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 12:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhCXLsB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 07:48:01 -0400
Received: from muru.com ([72.249.23.125]:46470 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230274AbhCXLr4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 07:47:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6EB468117;
        Wed, 24 Mar 2021 11:48:12 +0000 (UTC)
Date:   Wed, 24 Mar 2021 13:47:12 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, aford@beaconembedded.com
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Add AT25 EEPROM module
Message-ID: <YFsmwGtltToKzrWb@atomide.com>
References: <20210207124632.3486194-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207124632.3486194-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [210207 14:46]:
> The Torpedo development kit has an at25 SPI EEPROM on the baseboard.
> Enable it as a module in the omap2plus defconfig.

Thanks applying into omap-for-v5.13/defconfig.

Tony
