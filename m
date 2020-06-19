Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFBA20030E
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jun 2020 09:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730939AbgFSHzR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Jun 2020 03:55:17 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:35206 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730880AbgFSHzQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Jun 2020 03:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592553312;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dfYrFp/hQ23pDgzz7e1dMxR6kJ+1ykJbRSDOX8J5h5k=;
        b=rcuJOFbBtwgTdqzPTO8rpTTnnUYsbdlkpbQgn0EOLGT95WGYavgo1m5i6H47asWlSP
        Dcc9JvHgpiqJSkAWI4dT8Mwx3nnMsScLANkMVSkr6TD8JX/iwkf08T4iCZrM8ZHxrdq+
        xm+Sr12jXMIxw47jcKT5/YYXIVOlFIVCSjhFOKJeZUH33cz9X+Rzp+yJJqCTf3gwpT5T
        hjJ1+e+5I5LZSwSIgvtpMZ0wqtymsTwkBPQq4EO9bq4WPARgYXMR+aiUUW8AE4zMb6s1
        SKO6+YhTnLUSMH3MERJ6tveqmFygxNYb5Zxz9Y/FoR9qwMcuEU0PEU54tBd7pwQIuwW5
        hZNQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWeXA4EzKk="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id j05c09w5J7tBSAx
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 19 Jun 2020 09:55:11 +0200 (CEST)
Subject: Re: WL1271 on CM-T3730
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200617165149.GF37466@atomide.com>
Date:   Fri, 19 Jun 2020 09:55:10 +0200
Cc:     Oskar Enoksson <enok@lysator.liu.se>, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A8DD594E-7288-4C6C-9D22-21CBBF2232E1@goldelico.com>
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se> <20200616153921.GA37466@atomide.com> <a002d6ed-526a-bf82-b698-6182f9bb126e@lysator.liu.se> <20200617165149.GF37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,


> Am 17.06.2020 um 18:51 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Oskar Enoksson <enok@lysator.liu.se> [200617 10:45]:
>> Could someone please share a /proc/config.gz from some working board =
(with a
>> recent kernel), just to eliminate the possibility of something wrong =
there
>> after all?
>=20
> Looks like I don't have it, but it was just omap2plus_defconfig =
really.
>=20
>> And - are you using the omap3-cm-t3730.dtb or the =
omap3-sbc-t3730.dtb?
>=20
> I'm using omap3-sbc-t3730.dtb as I have the "single board computer".
>=20
> Regards,
>=20
> Tony

