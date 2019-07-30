Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE0407A72A
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jul 2019 13:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfG3Lkp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jul 2019 07:40:45 -0400
Received: from 50-87-157-213.static.tentacle.fi ([213.157.87.50]:46829 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726386AbfG3Lkp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 30 Jul 2019 07:40:45 -0400
X-Greylist: delayed 2689 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Jul 2019 07:40:44 EDT
Received: from jarkko by bitmer.com with local (Exim 4.84_2)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1hsPmy-0007As-Rj; Tue, 30 Jul 2019 13:55:28 +0300
Date:   Tue, 30 Jul 2019 13:55:28 +0300
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ASoC: ti: Mark expected switch fall-throughs
Message-ID: <20190730105528.GA27548@bitmer.com>
References: <20190729221534.GA18696@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729221534.GA18696@embeddedor>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jul 29, 2019 at 05:15:34PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning (Building: arm):
> 
> sound/soc/ti/n810.c: In function ‘n810_ext_control’:
> sound/soc/ti/n810.c:48:10: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    line1l = 1;
>    ~~~~~~~^~~
> sound/soc/ti/n810.c:49:2: note: here
>   case N810_JACK_HP:
>   ^~~~
> 
> sound/soc/ti/rx51.c: In function ‘rx51_ext_control’:
> sound/soc/ti/rx51.c:57:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    hs = 1;
>    ~~~^~~
> sound/soc/ti/rx51.c:58:2: note: here
>   case RX51_JACK_HP:
>   ^~~~
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  sound/soc/ti/n810.c | 1 +
>  sound/soc/ti/rx51.c | 1 +
>  2 files changed, 2 insertions(+)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com> 
