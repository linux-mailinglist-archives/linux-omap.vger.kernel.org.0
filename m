Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42F5587290
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 09:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405395AbfHIHAL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 03:00:11 -0400
Received: from muru.com ([72.249.23.125]:56828 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726212AbfHIHAL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Aug 2019 03:00:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1BF56809F;
        Fri,  9 Aug 2019 07:00:38 +0000 (UTC)
Date:   Fri, 9 Aug 2019 00:00:03 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Regression in next with codec unload and snd_soc_component_get/put
Message-ID: <20190809070003.GA52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Looks like commit 4a81e8f30d0b ("ASoC: soc-component: add
snd_soc_component_get/put()") causes a regression where trying
to rmmod a codec driver fails with module is in use error after
rmmod of snd-soc-audio-graph-card for example.

Any ideas what goes wrong there?

BTW, looks like the lore.kernel.org link in that commit also is
unreachable?

Regards,

Tony
