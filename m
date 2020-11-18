Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEF92B800B
	for <lists+linux-omap@lfdr.de>; Wed, 18 Nov 2020 16:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgKRPCj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Nov 2020 10:02:39 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41712 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgKRPCj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Nov 2020 10:02:39 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AIF22VO116792;
        Wed, 18 Nov 2020 09:02:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605711722;
        bh=rWpMzBY3yWlur1yTtazbVTURw/ATtp1VKkyOXw91Bj4=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=ry8M1VDyb5KRKxRQ2InLF8zUvU1rC4pB8+s3k3adL3TqlsDZj1f6MsU7mwZUrQOzz
         OmRwd7jsS6WXKBAIObtCoYBB6ub3EhofMxc6WIDoRppJAFsDuU1KiDS7gL3opqSolp
         xLytG7+/O2SPL+iz2z/xouIa6M56Iq+ohL5qhZ+Q=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AIF229k083984
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Nov 2020 09:02:02 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 09:02:01 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 09:02:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AIF2170038838;
        Wed, 18 Nov 2020 09:02:01 -0600
Date:   Wed, 18 Nov 2020 09:02:01 -0600
From:   Nishanth Menon <nm@ti.com>
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, <lkft-triage@lists.linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [arm] BUG: KASAN: slab-out-of-bounds in memcmp+0x30/0x5c
Message-ID: <20201118150201.7orvzppzd4rikg3m@shrine>
References: <CA+G9fYuk4imvhyCN7D7T6PMDH6oNp6HDCRiTUKMQ6QXXjBa4ag@mail.gmail.com>
 <CAK8P3a2MmA257e486D2hj_qj9Wk0ybkfg9yk9f5hR=h-KWUHVg@mail.gmail.com>
 <20201117232343.rg37fkacw43matmh@revered>
 <CAK8P3a0+RKdNj4q3GTh26jrwBkF-BgWiEUuFB4xbh8gZj4Q4-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK8P3a0+RKdNj4q3GTh26jrwBkF-BgWiEUuFB4xbh8gZj4Q4-g@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09:14-20201118, Arnd Bergmann wrote:
> On Wed, Nov 18, 2020 at 12:24 AM Nishanth Menon <nm@ti.com> wrote:
> > On 16:25-20201117, Arnd Bergmann wrote:
> >
> > Yes, this was indeed a bug that has been around for some time now :(
> >
> > I tested with a variant of the above (did'nt like that
> > oinfo was being assigned an invalid address)
> > Boot log: https://pastebin.ubuntu.com/p/nZfz3HF8N6/ (with the same
> > config as in the report): Would you prefer to me to send the following
> > as a formal patch?
> 
> Awesome, thanks for the new patch and testing it!
> 
> Yes, please send this as a proper patch to have it picked up
> into the regulator tree as a bugfix.
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>


Done. And thanks for the triage, Arnd.
https://patchwork.kernel.org/project/linux-omap/patch/20201118145009.10492-1-nm@ti.com/

Naresh,
Thanks for reporting the bug. That was an ancient one.. Glad we
could find it.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
