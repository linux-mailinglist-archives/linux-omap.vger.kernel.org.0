Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D3722B633
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jul 2020 20:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgGWSxe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 14:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbgGWSxe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Jul 2020 14:53:34 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DB7C206D8;
        Thu, 23 Jul 2020 18:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595530414;
        bh=3MN8t8y9ZPzg2hd+nYHHKUypvzn6YowNfDxcV2ZUaZI=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=X/7uRGMTKucKW1k1ALs6UQAv0cSyAdndk3Z39eeG9B0NVh8R00KqFaKijIrUWPJtM
         7SZd3On9XXgkgvrqEZ8dppSVIxeAcjm5jf09qMsVsUURRGfAjS+mJCFpFq959LO/KH
         Y4ZRcqa/lDiZOPm6v3EZ9Jb2Ek5wgDImDsRNszGY=
Date:   Thu, 23 Jul 2020 19:53:19 +0100
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, tony@atomide.com,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200719200623.61524-1-grandmaster@al2klimov.de>
References: <20200719200623.61524-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH for v5.9] regulator: Replace HTTP links with HTTPS ones
Message-Id: <159553039921.39979.10054073177417218787.b4-ty@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 19 Jul 2020 22:06:23 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Replace HTTP links with HTTPS ones
      commit: 2ca76b3e4954ea6bbb365005edc8d5237b488cf1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
