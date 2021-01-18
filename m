Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDE02F9AA1
	for <lists+linux-omap@lfdr.de>; Mon, 18 Jan 2021 08:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbhARHhi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Jan 2021 02:37:38 -0500
Received: from muru.com ([72.249.23.125]:55310 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730151AbhARHhh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Jan 2021 02:37:37 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CF88680AE;
        Mon, 18 Jan 2021 07:36:55 +0000 (UTC)
Date:   Mon, 18 Jan 2021 09:36:48 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH] drivers: bus: simple-pm-bus: Fix compability with
 simple-bus for auxdata
Message-ID: <YAU6kEhB4ilmasUO@atomide.com>
References: <20210115094231.62491-1-tony@atomide.com>
 <CAMuHMdXGvBDYe=Y3pvV9smhXUpo9daBsSD3ukn3N8M-fEKca5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXGvBDYe=Y3pvV9smhXUpo9daBsSD3ukn3N8M-fEKca5w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Geert Uytterhoeven <geert@linux-m68k.org> [210115 09:57]:
> CC DT
> 
> On Fri, Jan 15, 2021 at 10:42 AM Tony Lindgren <tony@atomide.com> wrote:
> > Later on we may want to consider handling simple-pm-bus directly in
> > drivers/of/platform.c as then we no longer need the platform data for
> > simple-pm-bus.

As we still need a device driver for simple-pm-bus this is not a good
option. I sent out v2 with updated description.

Regards,

Tony
