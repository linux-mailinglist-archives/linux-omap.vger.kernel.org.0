Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2309D303B4B
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 12:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392094AbhAZLQZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 06:16:25 -0500
Received: from muru.com ([72.249.23.125]:53202 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392197AbhAZLPr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 06:15:47 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D77C58057;
        Tue, 26 Jan 2021 11:15:08 +0000 (UTC)
Date:   Tue, 26 Jan 2021 13:15:01 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?QW5kcsOp?= Hentschel <nerv@dawncrow.de>
Cc:     robh+dt@kernel.org, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap3-echo: Add speaker sound card support
Message-ID: <YA/5tcX+Fw3nCsPu@atomide.com>
References: <20201227171353.2002674-1-nerv@dawncrow.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201227171353.2002674-1-nerv@dawncrow.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* André Hentschel <nerv@dawncrow.de> [201227 19:18]:
> This adds audio playback to the first generation Amazon Echo
> 
> Signed-off-by: André Hentschel <nerv@dawncrow.de>
> ---
> 
> It took me by far too long to get this working as the codec sets one important bit based on the
> combination of provided supplies. That was just too hidden for me.
> The first generation Amazon Echo was codenamed Misto, so I used that for the sound card name.

Cool, so it's now usable as a music player then :)

Applying into omap-for-v5.12/dt thanks.

Tony
