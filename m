Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA2116C3EB
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 15:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730731AbgBYObx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 09:31:53 -0500
Received: from muru.com ([72.249.23.125]:57440 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730704AbgBYObx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 Feb 2020 09:31:53 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9EFF1810E;
        Tue, 25 Feb 2020 14:32:36 +0000 (UTC)
Date:   Tue, 25 Feb 2020 06:31:48 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Mattias Jacobsson <2pi@mok.nu>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/2] Add SW_MACHINE_COVER key
Message-ID: <20200225143148.GG37466@atomide.com>
References: <20200215170216.14397-1-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200215170216.14397-1-merlijn@wizzup.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Merlijn Wajer <merlijn@wizzup.org> [200215 09:01]:
> this series adds the sw_machine_cover key, and changes the nokia n900 dts to
> expose the key via gpio-keys.

Looks good to me. It's probably best to apply these via the input subsystem
tree because of the generci SW_MACHINE_COVER key addition. For both patches:

Acked-by: Tony Lindgren <tony@atomide.com>
