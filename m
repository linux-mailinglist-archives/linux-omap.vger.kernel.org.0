Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5E06CA426
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 18:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390318AbfJCQWa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 12:22:30 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38392 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390309AbfJCQW3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Oct 2019 12:22:29 -0400
Received: by mail-ed1-f66.google.com with SMTP id l21so3071428edr.5
        for <linux-omap@vger.kernel.org>; Thu, 03 Oct 2019 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zgiIl2UmnymsEs7W7Y/0luQQ7GJPPBSiJs/1Ty1rsK0=;
        b=rkyDoupCerKeqe5O5z5bzTnbyeWAjQxXfTbOxOz+SLqZLG5hMOeu9MzKK+7sniDVSZ
         vQYfRwlXM7F2FjLguFqk6g2+IMKJpAqloCuIuxhQPBFO5y60vMhJnF6Fo3tD83dX0gwF
         NlgTroSbDnyty/H3cVHXq6uac0bsDfXUgu6wRMfz3C4aGL3AKGqhHz5l5YyAlhLAv3DR
         Etek/+N6YtviUrfoPr7s4OQ4HYvDB+dLGwqF3iWtvXcsGv9TwXOBZAaBNDfXDA1AteLD
         q/FIpkPDNsnkyxgqWR4zAIYDbSB7D2hZ4jWUy8wvkLjhGtSLiLepnIMRShJrOXTKr3/k
         tDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgiIl2UmnymsEs7W7Y/0luQQ7GJPPBSiJs/1Ty1rsK0=;
        b=HBtwdgtWSkrCe7/cDfpfS+6S7iBIqOfX8L9k0DasJTjKmX475bVsRUybrvP+AgFSzx
         6dFRXGasCEbUpLpp3JaDTWOXelkkg98lWDbfX1B1nkHrlAo7vKE7Deiz4nn+oauAGmL+
         YI4TPTTXEyvRGOC1Vs+uzg3y5/B6FcKbE63wbm05NrLVb5nThDwfhEz8eQqnpl0YAJxR
         K+ciESm2MhkzODgb8NsL7hhxJIIudR/Ofyj0P0jcFrjEhKfI8a4Bx7HJX+lpU1tw6Vj3
         P4HCduThlV0kwTlZOhKs220baZYTRji1OdQMaGKKiNBh36iXy/KBYJ/BE8zXFCf1CcVS
         X4nw==
X-Gm-Message-State: APjAAAXBJ+Xg+DjVSwGJyKnvxks8mN+SYKfmpW5VM+CMVIxDTkR8Reh9
        b5MjSyU4RuwF5EA2EytViXcKbqSvnQD9JvDW9klqOQ==
X-Google-Smtp-Source: APXvYqwYYpQV3/dIPap2YGzTn+v9evDh/nI2myNoel0fTmROYiguWslZ1XNfJc/p+s/yLiLvLymESiH2fKEyjlJ9Vf4=
X-Received: by 2002:a17:906:5382:: with SMTP id g2mr8406831ejo.203.1570119747699;
 Thu, 03 Oct 2019 09:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <pull-1570040410-308159@atomide.com>
In-Reply-To: <pull-1570040410-308159@atomide.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 3 Oct 2019 09:22:15 -0700
Message-ID: <CAOesGMg_5omTAeyjeS_GOF8drtjS3DEQz_0+8XP2HhnD8X_wMA@mail.gmail.com>
Subject: Re: [GIT PULL] fixes for omaps for v5.4
To:     Tony Lindgren <tony@atomide.com>
Cc:     SoC Team <soc@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 2, 2019 at 11:21 AM Tony Lindgren <tony@atomide.com> wrote:
>
> From: "Tony Lindgren" <tony@atomide.com>
>
> The following changes since commit 4d856f72c10ecb060868ed10ff1b1453943fc6c8:
>
>   Linux 5.3 (2019-09-15 14:19:32 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/fixes-rc1-signed
>
> for you to fetch changes up to f90ec6cdf674248dcad85bf9af6e064bf472b841:
>
>   ARM: dts: am4372: Set memory bandwidth limit for DISPC (2019-09-30 09:32:03 -0700)

Merged, thanks!


-Olof
