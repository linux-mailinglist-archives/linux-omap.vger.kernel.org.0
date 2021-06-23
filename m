Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFDA3B22A7
	for <lists+linux-omap@lfdr.de>; Wed, 23 Jun 2021 23:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFWVqT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Jun 2021 17:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhFWVqR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Jun 2021 17:46:17 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1DAC061574;
        Wed, 23 Jun 2021 14:44:00 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010::e64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id EB6481B0023A;
        Thu, 24 Jun 2021 00:43:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1624484638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oGiKnvYqlcWHaf4zns4Bkt3JTQrRywYMbIHDJ2RnZj0=;
        b=BaQdPTJqnqOB+eh6aZONaLt2wzG6HPs+XKCM/peErVNzMa2kk6Bsln8Db8MmEtHmJe0zrK
        pSGb+xiTUc4UQDXfeSlKl5UAPfNdUym28iDipCGyNsqewGlTX6Sfp8VfT0T/dxH7hwd0Me
        kyt1589ZIJqxg2+XBddvpL+801G5lkDQLXQkXGte4Eqs4njD5H5x3mFhMrzWV+y6JGFM+i
        T89zNJsVgHpJTG6pcj/WhWOZ/3l3SVHvy+nkKdVGnED5Dbt3kqv/L9TI5t+kXZE6sOkwUk
        oTd5lkA58zdYTy8qUI8PPxj/X9MgexgzpOHsNVMD3BgCj+mVQGhVN078FJq4TQ==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A94B1634C87;
        Thu, 24 Jun 2021 00:43:44 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lwAf7-0000xJ-HW; Thu, 24 Jun 2021 00:43:57 +0300
Date:   Thu, 24 Jun 2021 00:43:57 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Subject: Re: Regression? omap2plus_defconfig bloat due drivers/media/Kconfig
 changes
Message-ID: <20210623214357.GH3@valkosipuli.retiisi.eu>
References: <2d389925-db9d-58f5-7928-0baa5f187afb@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d389925-db9d-58f5-7928-0baa5f187afb@bitmer.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1624484638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oGiKnvYqlcWHaf4zns4Bkt3JTQrRywYMbIHDJ2RnZj0=;
        b=QFevLKxuXLOGL3Wnp9FksUGZ2KYJlhr+DVPfzkPgQqpQWQYobj5Hft0fPlqo5I4IUWOJoo
        6qQTRhBTTSVL14MdYXUQjZIgqJtB750TICj0jMyNrpdFoyWSuouTbAimb/LVw+2nbO9N11
        R1/6zlKg9AZFqw+GBlFJq90p7UblR6C5Ykd08Bvvz+Gy4e6iKqQIBSx6jYqLKiJAbSSuyA
        lMrAVYa0gyz23Wep1QwQNfFhWLmIeJ19aJ+Qlc5UJu6t9ozA25q7lXoWIazFp8SWV6CGlC
        gwL37e/OrV5xK39RX+UJkrSL1lcaf9WCi+JjPpwu3kCVTsXfyYR+58bxBYp6vA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1624484638; a=rsa-sha256;
        cv=none;
        b=UBaiXvx4640/PzWKc44CKbsAjuTMqfIPOrUDMjYJk8UsHD/5P1gqE2sxcphYxhgQnq/ob6
        OSdeujim5F7HcSLfiK+c5ovrQjcsmkx1ileYC2I5Im99ezuCWJRAe18BE1zf1zUHojgDHp
        NX44qd3wOG+Kqp+XRckmOaoH3QFHMlnIs2XLtdXrJFvMeRkLUY4nneELR6HK6Jy+zzIflq
        QKz6X5EkOhG4xRv0IKb9MODdLhMapumpD99yBmvFlUEGml92OIMyrn7q/gu/bFSzS+ovqz
        h2GzCOnyQU8Zz6yazVdrZqmiNzuidPZyq/BfSdu9L8M07b5Weq2mUX1DIpXdyQ==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Heipparallaa!

On Sun, Jun 13, 2021 at 09:03:21PM +0300, Jarkko Nikula wrote:
> Hi
> 
> I noticed omap2plus_defconfig build is much slower than before and I saw
> during build many DVB drivers were compiled. Which made me thinking it
> doesn't look right especially there are no changes in
> arch/arm/configs/omap2plus_defconfig related to DVB.
> 
> I tracked manually last good and first bad
> arch/arm/configs/omap2plus_defconfig change.
> 
> This was tested by "make ARCH=arm omap2plus_defconfig" and grepping is
> CONFIG_DVB_CORE set in .config.
> 
> good: 8b136018da7b ("mm: rename CONFIG_PGTABLE_MAPPING to
> CONFIG_ZSMALLOC_PGTABLE_MAPPING")
> bad: 8aa6361f7251 ("ARM: omap2plus_defconfig: enable twl4030_madc as a
> loadable module")
> 
> Then I started bisecting which commit adds CONFIG_DVB_CORE and found
> commit 8e5b5d75e9d0 ("media: Kconfig: DVB support should be enabled for
> Digital TV").
> 
> That alone didn't look the answer so bisected then commit adding
> MEDIA_DIGITAL_TV_SUPPORT and found c6774ee035dc ("media: Kconfig: make
> filtering devices optional").
> 
> I'm not familiar with media subsystem but after that commit bunch of
> media drivers will get enabled when CONFIG_MEDIA_SUPPORT is set but not
> CONFIG_MEDIA_SUPPORT_FILTER.
> 
> I don't know is that best to fix in omap2plus_defconfig or
> drivers/media/Kconfig. Just thinking if there are other minimal
> defconfigs with the same issue?

There was a change how the drivers for these little bits of hardware are
selected, enabling them all by default. So things generally work
differently they did before... One option would be to enable
MEDIA_SUPPORT_FILTER in the configuration, so only those devices that
you're interested would be supported.

-- 
Terveisin,

Sakari Ailus
