Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06ED5344B10
	for <lists+linux-omap@lfdr.de>; Mon, 22 Mar 2021 17:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhCVQUX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Mar 2021 12:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbhCVQUA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Mar 2021 12:20:00 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89E7C061574;
        Mon, 22 Mar 2021 09:19:59 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id jy13so22239504ejc.2;
        Mon, 22 Mar 2021 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M2qJujAvQn4a05nBn1hE9oaaQsAdwEJ2YaUJEOPRz10=;
        b=puag+iLGmGsMChji5EvUsfWZZYZlRtN6KZ6s9XtgvXIbn0zkB8zQpZkfBraPcKme00
         KJXh9/5dntT0/lASwlNa9N2tZEoRCho4+aB5ohASUOOKiy5NHnZ0JC/rKX+HEVXHHCdq
         fbQjLeVwLZqiJZQ45Fhc2dA3+qsmkhfXc86ka8bL74NixHDEBhXTCTuB76jOalo9Auf0
         yC94P6Dxd1HOp8+z/v+Cd8cGA54lGLEryhuZdRI8eciCAov9ZmYaV/N1sH+CUWyn5f6X
         V8IVfdvn2KDLaJd2JkYkHzNtnrryhurBSN7on0xoGY6tFjh8JW7+xcYKHJ7y3yiZPYox
         3HgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M2qJujAvQn4a05nBn1hE9oaaQsAdwEJ2YaUJEOPRz10=;
        b=sRNRKpWYgkogUe3mefUVUHj/f95LL6MCIqd5SBdJuAg/Dm65rqRJSuNV64r+UEZySg
         Ca51HdoQpiPx77mIGpjNvYNDyePrchd1pVpP9cyMaUjtzjJq6w786+d5aJThACq1hlos
         75AXp0RSraavQekjYppIDuLa5VAOL4RpvrDErXSVLGi1TvOVcZGpbCjubhYJ8g8S37lB
         LdTeSBkzYTSb22yQcCZRNjxehk1Fnu12gsxEdu6ofk/qGTN9qq14EI9iUjz3uIlfDgbh
         gHMOrLU6L3KWmFxG4J+QwhbOxZ3pG9t71aoDOpT7O40fw9jSdLKRc0E2jU942bxI3bfi
         AazA==
X-Gm-Message-State: AOAM5324BAT5FI7ozygL6iAozIhfdU5PmQTOT8rQagYZZsDpqn54hX1v
        Ck4ag//vNMicAo8AbviUI0c=
X-Google-Smtp-Source: ABdhPJzFxfToTXlkbA2OiWFgmebyVaHb5IFCzmrKPNggnZ2tsSeTen7AN5pgak718yanRFaH0NArUw==
X-Received: by 2002:a17:906:f6ce:: with SMTP id jo14mr602315ejb.476.1616429998414;
        Mon, 22 Mar 2021 09:19:58 -0700 (PDT)
Received: from skbuf (5-12-16-165.residential.rdsnet.ro. [5.12.16.165])
        by smtp.gmail.com with ESMTPSA id e16sm9848456ejc.63.2021.03.22.09.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 09:19:57 -0700 (PDT)
Date:   Mon, 22 Mar 2021 18:19:55 +0200
From:   Vladimir Oltean <olteanv@gmail.com>
To:     Tobias Waldekranz <tobias@waldekranz.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roopa Prabhu <roopa@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Ido Schimmel <idosch@idosch.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, Vadym Kochan <vkochan@marvell.com>,
        Taras Chornyi <tchornyi@marvell.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Ivan Vecera <ivecera@redhat.com>, linux-omap@vger.kernel.org,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [RFC PATCH v2 net-next 09/16] net: dsa: replay port and local
 fdb entries when joining the bridge
Message-ID: <20210322161955.c3slrmbtofswrqiz@skbuf>
References: <20210318231829.3892920-1-olteanv@gmail.com>
 <20210318231829.3892920-10-olteanv@gmail.com>
 <87wntzmbva.fsf@waldekranz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wntzmbva.fsf@waldekranz.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Mar 22, 2021 at 04:44:41PM +0100, Tobias Waldekranz wrote:
> I do not know if it is a problem or not, more of an observation: This is
> not guaranteed to be an exact replay of the events that the bridge port
> (i.e. bond0 or whatever) has received since, in fdb_insert, we exit
> early when adding local entries if that address is already in the
> database.
> 
> Do we have to guard against this somehow? Or maybe we should consider
> the current behavior a bug and make sure to always send the event in the
> first place?

I don't really understand what you're saying.
fdb_insert has:

	fdb = br_fdb_find(br, addr, vid);
	if (fdb) {
		/* it is okay to have multiple ports with same
		 * address, just use the first one.
		 */
		if (test_bit(BR_FDB_LOCAL, &fdb->flags))
			return 0;
		br_warn(br, "adding interface %s with same address as a received packet (addr:%pM, vlan:%u)\n",
		       source ? source->dev->name : br->dev->name, addr, vid);
		fdb_delete(br, fdb, true);
	}

	fdb = fdb_create(br, source, addr, vid,
			 BIT(BR_FDB_LOCAL) | BIT(BR_FDB_STATIC));

Basically, if the {addr, vid} pair already exists in the fdb, and it
points to a local entry, fdb_create is bypassed.

Whereas my br_fdb_replay() function iterates over br->fdb_list, which is
exactly where fdb_create() also lays its eggs. That is to say, unless
I'm missing something, that duplicate local FDB entries that skipped the
fdb_create() call in fdb_insert() because they were for already-existing
local FDB entries will also be skipped by br_fdb_replay(), because it
iterates over a br->fdb_list which contains unique local addresses.
Where am I wrong?
