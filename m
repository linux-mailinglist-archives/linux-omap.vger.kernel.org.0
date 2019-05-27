Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D79862AEBD
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 08:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfE0Gcy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 02:32:54 -0400
Received: from muru.com ([72.249.23.125]:51060 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbfE0Gcy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 May 2019 02:32:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 70E5880F3;
        Mon, 27 May 2019 06:33:13 +0000 (UTC)
Date:   Sun, 26 May 2019 23:32:50 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc:     Thomas Huth <thuth@redhat.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        linux-omap@vger.kernel.org, qemu-devel@nongnu.org,
        linux-kernel@vger.kernel.org,
        Peter Maydell <peter.maydell@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-devel] Running linux on qemu omap
Message-ID: <20190527063250.GI5447@atomide.com>
References: <20190520190533.GA28160@Red>
 <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
 <20190522093341.GA32154@Red>
 <20190522181904.GE3621@darkstar.musicnaut.iki.fi>
 <8977e2bb-8d9e-f4fd-4c44-b4f67e0e7314@redhat.com>
 <c2972889-fe60-7614-fb6e-e57ddf780a54@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2972889-fe60-7614-fb6e-e57ddf780a54@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Philippe Mathieu-Daudé <philmd@redhat.com> [190523 12:01]:
> What I use as reference for testing ARM boards [*] is the work of
> Guenter Roeck:
> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/run-qemu-arm.sh

I think Guenter also has v2.3.50-local-linaro branch in his
github repo that has support for few extra boards like Beagleboard.
Not sure what's the current branch to use though.

Regards,

Tony




