Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10724246578
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 13:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgHQLbs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 07:31:48 -0400
Received: from muru.com ([72.249.23.125]:40568 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728252AbgHQLbr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Aug 2020 07:31:47 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E2B2880A3;
        Mon, 17 Aug 2020 11:31:46 +0000 (UTC)
Date:   Mon, 17 Aug 2020 14:32:13 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, aford@beaconembedded.com
Subject: Re: [PATCH] ARM: dts: logicpd-torpedo-baseboard: Fix broken audio
Message-ID: <20200817113213.GJ2994@atomide.com>
References: <20200809025610.3104837-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200809025610.3104837-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200809 05:56]:
> Older versions of U-Boot would pinmux the whole board, but as
> the bootloader got updated, it started to only pinmux the pins
> it needed, and expected Linux to configure what it needed.
> 
> Unfortunately this caused an issue with the audio, because the
> mcbsp2 pins were configured in the device tree, they were never
> referenced by the driver. When U-Boot stopped muxing the audio
> pins, the audio died.
> 
> This patch adds the references to the associate the pin controller
> with the mcbsp2 driver which makes audio operate again.

Thanks applying into fixes.

Tony
