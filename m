Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5697C6630F2
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jan 2023 21:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbjAIUJX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Jan 2023 15:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237109AbjAIUJV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Jan 2023 15:09:21 -0500
Received: from 13.mo561.mail-out.ovh.net (13.mo561.mail-out.ovh.net [188.165.33.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686651BCBF
        for <linux-omap@vger.kernel.org>; Mon,  9 Jan 2023 12:09:19 -0800 (PST)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.4.192])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id 6C144247D9
        for <linux-omap@vger.kernel.org>; Mon,  9 Jan 2023 19:53:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zhwml (unknown [10.110.208.112])
        by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7EEE11FEED;
        Mon,  9 Jan 2023 19:53:51 +0000 (UTC)
Received: from sk2.org ([37.59.142.98])
        by ghost-submission-6684bf9d7b-zhwml with ESMTPSA
        id SIYmDM9wvGPphQEAR6C6Tg
        (envelope-from <steve@sk2.org>); Mon, 09 Jan 2023 19:53:51 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R002dcb81ab0-aa44-4050-9c7a-c7c6d9d4b65a,
                    796317D5D98EA53ED2B7ABF3FE0FDD27B7A2AA3D) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date:   Mon, 9 Jan 2023 20:53:44 +0100
From:   Stephen Kitt <steve@sk2.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-staging@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sam Ravnborg via B4 Submission Endpoint 
        <devnull+sam.ravnborg.org@kernel.org>,
        Antonino Daplas <adaplas@gmail.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Robin van der Gracht <robin@protonic.nl>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        linuxppc-dev@lists.ozlabs.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight
 handling
Message-ID: <20230109205026.4c672dc8@heffalump.sk2.org>
In-Reply-To: <Y7smdFs2xgJwwVQO@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
        <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
        <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
        <Y7nb2q6SDota/rTU@ravnborg.org>
        <366FC0B8-21E2-4642-A5A5-CF4B6AB046B0@sk2.org>
        <Y7smdFs2xgJwwVQO@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WkKI4pNhPlPhuyNdSzKYHjs";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 8129841754002130566
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfofggtgesghdtreerredtvdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepjeevgfeigfeukeeujeeghfefjeffjeffjeetffeludelgeevfeejtdekvdevvdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshhtvghvvgesshhkvddrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/WkKI4pNhPlPhuyNdSzKYHjs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sun, 8 Jan 2023 21:24:20 +0100, Sam Ravnborg <sam@ravnborg.org> wrote:
> > Here are my pending patches from last June on lore:
> >  =20
>=20
> All patches are handled I think except this:
> > * https://lore.kernel.org/lkml/20220608205623.2106113-1-steve@sk2.org/ =
=20
>=20
> Can I ask you to drop the assignment that is not needed, and resend with
> the collected acks/r-b.
>=20
> With this, then all fbdev patches are handled.

Ah yes, it was revised as
https://lore.kernel.org/lkml/20220609180440.3138625-1-steve@sk2.org/ which
only got one ack (from you,
https://lore.kernel.org/lkml/YqJCKQmQEuVsbspK@ravnborg.org/). Should I
resend that or is that usable as-is? Or would it be better if I sent all the
fbdev patches again (collecting all the acks and reviews)?

Regards,

Stephen

--Sig_/WkKI4pNhPlPhuyNdSzKYHjs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmO8cMgACgkQgNMC9Yht
g5z/hg/+M/SIiugiRlPu8/75brBREB81GIjjW2/r/pcvIdkETebFoCKAFma2bIgo
VljGHiYUQygcfAT+SNwI5wRrMKaNDug+L7iXVOpE9ouBd3SAk65zo8e3xcH6hTJV
GV7tVbhrQQwIwYGE/xf8ndGBVbHriXm2TZlCV48cNGIK9Gm9mn2yo3791fF/HpLC
iLJNAG0tEukItdoNh+0HaT3AFj6SQMZCz9mHLCJS6Jpcltr920pa9eeCxpmcMupK
/hzGcQaMKbpClKn+2h0st9aC3pBcw9kresTlcFlvo7avT7OFqQkV5+YuntPA2SlC
oY9vS0ztE9capaPic4fsESf4i44NW58vceg96Ill1ZrJyUcXDdq/gntBi3SfM05W
+DDJaIQQfSsnaqsPGn3AB7CTOeW4cATaih197XFdUcUtoW5nIrSRsCDlpbEmjpwr
bPsM0KyqJJ5qJXictFaBoD0LDHNHNVVfyn4qA24N/PsgHQxtTaSVZR6ASx9/WI9w
L83/tK68OFp7m14Z5tvdMHOI7oOUJO6L67wVtP8UrH+YW2NfBwcECQbanhU4cinF
EWR7e1UlYF2APGsvx/BPrY21rOW4tYnp5WlUqO/SD1sMCWPVjN6LeFIELCW3bIHw
/jCr9HY2gX6KPDEqkI6grOB+ffgNGgKvPQEOeL+BGNcywWCZTtk=
=EEPd
-----END PGP SIGNATURE-----

--Sig_/WkKI4pNhPlPhuyNdSzKYHjs--
