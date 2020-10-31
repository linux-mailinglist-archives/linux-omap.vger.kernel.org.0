Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BD62A13EC
	for <lists+linux-omap@lfdr.de>; Sat, 31 Oct 2020 08:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgJaHPo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 31 Oct 2020 03:15:44 -0400
Received: from muru.com ([72.249.23.125]:47240 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbgJaHPo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 31 Oct 2020 03:15:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 671C280A3;
        Sat, 31 Oct 2020 07:15:48 +0000 (UTC)
Date:   Sat, 31 Oct 2020 09:15:39 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-omap@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: motorola-mapphone-common: Add dts
 configureation for the android buttons beneath the screen
Message-ID: <20201031071539.GM5639@atomide.com>
References: <20201030100550.010bfe4f3cdc2f4e5a599c8b@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030100550.010bfe4f3cdc2f4e5a599c8b@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Carl Philipp Klemm <philipp@uvos.xyz> [201030 09:06]:
> Adds a driver for supporting permanet, physically labeled, buttons on
> touchscreen surfaces. As are common on android phones designed with android 1.0
> to 2.3 in mind. The driver works by attaching to another input device and
> creating key events on its device when a press is registerd on a button.
> It also provides a mirrored touchscreen device with the same events as the
> attached device, but with the touchches that land on buttons filterd away
> Buttons are arbitrary rectangles configurable via dts.

Nice to have a generic way for the touchscreen buttons :)

Care to summarize here too what's currently blocking touchscreen buttons
driver only providing the keyboard events as a separate inputdevice
without having to mirror all the touchscreen events?

Regards,

Tony

