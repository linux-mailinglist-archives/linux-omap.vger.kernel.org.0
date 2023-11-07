Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAD37E4158
	for <lists+linux-omap@lfdr.de>; Tue,  7 Nov 2023 14:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjKGN6B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Nov 2023 08:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjKGN6A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Nov 2023 08:58:00 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DBCA2;
        Tue,  7 Nov 2023 05:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1699365448; x=1699970248; i=deller@gmx.de;
        bh=p0n3xVOp9BeJAf/wjJtPJiFlqD7fJ/EeIppkkT97BkY=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
         In-Reply-To;
        b=q+tJ7lCQ61BVh95hguZrSopxCmOFoIDAQjiEgLjNGkiw0oECVKUNChRObc6po+i2
         IWtFeNXDemxh3PmX65kO3N95sYcgDx7OzFUctYkjO2nNgHbZNxt3URLHmPjv6yjgk
         1RBIoy3kPY5O4P4pHJqDxFDGhXmo10j3z38R8HbO+jj8xKAPbJmnTEOzU8ynJYEbT
         XM9VkKqw0ZnbUAjCg56aHONNZwkx0dlDr8eKk9LznmpGjZQlY2H7EnKYdFaO8AqvN
         ypyVK+g3mCZeie7H1SxqISG12T4KjN8EdcNcdVqf71z0fLHXtRexE8yHZ5tHWYd3m
         YaRfi39qLw3NHuZo6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.202]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zFj-1rV0Qt2ENv-0154EG; Tue, 07
 Nov 2023 14:57:28 +0100
Message-ID: <d23a19eb-6f13-407c-a09e-ce55fb903171@gmx.de>
Date:   Tue, 7 Nov 2023 14:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] fb: handle remove callbacks in .exit.text and
 convert to .remove_new
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Atul Raut <rauji.raut@gmail.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-omap@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Stephen Kitt <steve@sk2.org>, Rob Herring <robh@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JN2iC4gf0zkfiA/NEAWl8Kgbg7aqYMvjyof2nBrypp5HNWUqwwd
 2wNodxKU5c+r4FJhlxXAKBRq+r88f+ToXEDZ9lhHZnxaqU3aozBM42jE3V/SgO3Y9UYydGI
 FDr5foFxzcTGBmpzPYe3ugd8bkHxJqDIKcMHBCzMe6jFiHp1nLr8eV8i7CeScUaLoN78L+N
 tMKvFNQd+GxYKk+TPbHMA==
UI-OutboundReport: notjunk:1;M01:P0:k2g+Ph0Aa2g=;7p5xbbnGTZErlS9iSPv/+gSNye+
 GGrrCp53vJYDCHHB2bBVVfhbGbtHoNOUOzXiDmL3hf1Tmsvj5ud/4/HDaGFL4WdAGmA5mknuf
 f8ESfqVzkHjuTowpMvozpH2l1bj+gnCl8X/hE4Kc831wiq20LQi0xdf7tTSqiYF3kjj9Tn9Y/
 Y0RwzeNEhxvZ2ei7jj9Z3AmtIhlVM++AT40bUvL5TqzPOKwi28V/vMXY0ZlCF5oqxMPCczZlH
 tnhx9EBuax8x1UIW6Ympl2q16mHatS4lh/u4XS2d7QCPRTA2lW6/KsDwoDcNHgKoWWTK+CWXH
 VKw/EB8EMB1AkR4o+GphmWYKVyQlY2FFfBTJj819yct+bm7+FxnM2jb2o7zacFbTbJYTUue7v
 /nVJgA3YmW7BA1OtctFXRHWQq0uAwUrvPlh0BsqTJks5roP8HCX+yrLmqkxw7oYuiDk6nNFfb
 5kF2wp2asMAPEGHCXdfAQ78WbP7cJWxun51/RMURmR2jjBXaKOSM41SRHbfCrLYmkWFQlucag
 xVU1ZqQD/PLczQVG0GLyVJZbOFVbwHL8SXJET5GQXyrsaIaO5ccS6VaNKqgjMr8cxS5+HTZJz
 maRqPVRvoUSqEdTurpJTfPhbrtrcAMh7FElx5CWG01JnV0ZSTuk3iTurUTIFqHXnuy/7Gg33P
 /Zak2HrCyVQy2clhv7mfbu+AU/ZNXOXPxHsAUdF+ZOngM24pFMbC0lDDZnY15X+yp48feZ8+q
 DZ38TkfqOdBII5rZwzL1df80wstGQMBot1RzQjKNCJbf+5WEv1tbUx2p/ZGH+fYt8fj/AJUVb
 pEsk/q2T8itDecULn1hGe2ZCpBD8t1Fr9EjjbxJz+qmmGBzX9XxygenAqm7Peh+MTcguOI1FK
 aPOhKUne3+yax8lGMGh14W8JFfRbT/rlZngGlCO49P4afU/0nAqXOHQF9z8/d3VJpbrqj20ef
 F0fANgraUM7W1MUJDjOavo7ng8U=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/7/23 10:17, Uwe Kleine-K=C3=B6nig wrote:
> there are currently several platform drivers that have their .remove
> callback defined in .exit.text. While this works fine, it comes with a
> few downsides: Since commit f177cd0c15fc ("modpost: Don't let "driver"s
> reference .exit.*") it triggers a modpost warning unless the driver
> struct is marked with __refdata. None of the drivers in
> drivers/video/fbdev get that right (which is understandable the warning
> was added only recently). While it would be possible to add that marker,
> that's also a bit ugly as this bypasses all other section checks that
> modpost does. Having the remove callback in .exit.text also means that
> the corresponding devices cannot be unbound at runtime which is
> sometimes usefull for debugging purposes.
>
> To fix the modpost warning I picked the progressive option and moved the
> .remove() callbacks (and for two drivers also .probe()) into .text (i.e.
> the default code section) and dropped .suppress_bind_attrs =3D true (whi=
ch
> is implicitly set for drivers using platform_driver_probe()).  Note even
> though these patches fix a warning, it currently only happens with W=3D1=
,
> so this isn't urgent and there is no need to apply these before v6.7.
> The next merge window is fine (although I wouldn't object an earlier
> application of course :-) The alternative is to add the __refdata
> marker, ideally with a comment describing the need. (See e.g. commit
> 141626dbc2e6 ("rtc: sh: Mark driver struct with __refdata to prevent
> section mismatch warning") .)
>
> As a follow-up I converted the affected drivers to .remove_new(). There
> was already a series doing this for the other drivers in
> drivers/video/fb, but my coccinelle script missed these drivers as it
> didn't handle
>
> 	.remove =3D __exit_p(removefunc),
>
> . See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal. I
> considered creating a second series for this conversion, but as the
> patches conflict I put all patches in a single series to make it easier
> to apply it.

Thanks Uwe!

I've applied the series as-is to the fbdev for-next git tree.
The patches look ok, and if they survive the next few days they will go
upstream soon.

Helge
