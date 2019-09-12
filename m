Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56986B14A3
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 20:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfILS74 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 14:59:56 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:33396 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbfILS74 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 14:59:56 -0400
Received: by mail-io1-f65.google.com with SMTP id m11so57385176ioo.0
        for <linux-omap@vger.kernel.org>; Thu, 12 Sep 2019 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LnP3Gm6Jc1lc0jJ7iQHoKu8W9WN/FBB3195mE9f1fRw=;
        b=rDEcd5ZLqvyrmdTAQ1O6QGIKWziSrVcj0EgO/ddU6SlqH6Kaeq860+ilsVDOYQ3fIO
         HP17/1hCYwyyzoCVXrxR+6I8KdhVCNBrp2VDX8+dK7wEi3e5xZ/jhfUA5hme2MBhbw6N
         ihCOMODXF/gfFgePDlYuc3+6bcmsq1AJ85aCSaL64OWUSzg/auGfKg9xdeALQMHle4VW
         6ymIqb6f4fyh5w9fl6ON4IEkeZRo684S0FWO88cSUVYjdQ+6N6ER01iAgyABg6dEKgkH
         cAxicsHKWkxtt1vTzJIDWqoeC9zLhiUBrSACKRaNhykHKIJ0vvYKPEkH0iu6iPUdqaN2
         urNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LnP3Gm6Jc1lc0jJ7iQHoKu8W9WN/FBB3195mE9f1fRw=;
        b=ORrQUvNPLj9VWrsDmHLhZEnJuovwZfIPlKKSE4dwtl6beHldaGt3iFphjuMrthgLFC
         RQwuOtWTlo8HSiU5PAubz81cFhnIYJRldjLTQtrxUhh+AjlYXTH2YycWFDmq2Dw2f9T6
         B/AJsddqTviZ8fNIeFb9IwJTENql05Q0l8Uu98fCIdB5ygNgRUC9spXflhBuwwDkAiUs
         vId4+9WpR5uoIGKw1c2502+uvEKHXde+a1B3gLzil+kAc73Cf0Q5P6Ypy3pcc45qVbFw
         yOUoiZ0R8wJ4mOjufCJg7vJajLgOtNfo2XPNMOoaI0bi1B0xauoOGzNtvOdymSqKeGA5
         5nOg==
X-Gm-Message-State: APjAAAUbzL6GagW45ddRdLmV3LLCjFbL+li4Q8JQcj7WhY47VLxaem7J
        2OCCljXL21PUbeSdgaX8zwfBUVrrM1LR8hHSsBsf52tj
X-Google-Smtp-Source: APXvYqzAeRIt8QZ6r1yW9eUgKQ3/JjfpYpyIKGHLbPS+8GyKambAnNyWVTqVl4s9fkaskkJ+Of7YVjtx/cTHYSPmM3g=
X-Received: by 2002:a5e:de47:: with SMTP id e7mr6111800ioq.127.1568314795228;
 Thu, 12 Sep 2019 11:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012823.28730-1-neolynx@gmail.com> <20190801012823.28730-2-neolynx@gmail.com>
In-Reply-To: <20190801012823.28730-2-neolynx@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 12 Sep 2019 13:59:43 -0500
Message-ID: <CAHCN7x+Vd+ECoa4fmUfoX47znag+NxKSzRt3iouQCZ2CQ2T--A@mail.gmail.com>
Subject: Re: [PATCH 1/3] OMAP3: PM: Set/clear T2 bit for Smartreflex on TWL
To:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@ti.com>,
        Thara Gopinath <thara@ti.com>,
        Shweta Gulati <shweta.gulati@ti.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jul 31, 2019 at 8:29 PM Andr=C3=A9 Roth <neolynx@gmail.com> wrote:
>
> From: Thara Gopinath <thara@ti.com>
>
> Voltage control on TWL can be done using VMODE/I2C1/I2C_SR.
> Since almost all platforms use I2C_SR on omap3, omap3_twl_init by
> default expects that OMAP's I2C_SR is plugged in to TWL's I2C
> and calls omap3_twl_set_sr_bit. On platforms where I2C_SR is not connecte=
d,
> the board files are expected to call omap3_twl_set_sr_bit(false) to
> ensure that I2C_SR path is not set for voltage control and prevent
> the default behavior of omap3_twl_init.
>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Thara Gopinath <thara@ti.com>
> Signed-off-by: Shweta Gulati <shweta.gulati@ti.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kevin Hilman <khilman@ti.com>

Tony,

Is there a status update on this series?  It's been several months,
and I haven't seen any feedback on it, nor does it appear to be in any
of your branches that I can see.

adam
> ---
>  arch/arm/mach-omap2/omap_twl.c | 60 ++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_tw=
l.c
> index 6787f1e72c6b..1dae906128c2 100644
> --- a/arch/arm/mach-omap2/omap_twl.c
> +++ b/arch/arm/mach-omap2/omap_twl.c
> @@ -43,8 +43,15 @@
>
>  static bool is_offset_valid;
>  static u8 smps_offset;
> +/*
> + * Flag to ensure Smartreflex bit in TWL
> + * being cleared in board file is not overwritten.
> + */
> +static bool __initdata twl_sr_enable_autoinit;
>
> +#define TWL4030_DCDC_GLOBAL_CFG        0x06
>  #define REG_SMPS_OFFSET         0xE0
> +#define SMARTREFLEX_ENABLE     BIT(3)
>
>  static unsigned long twl4030_vsel_to_uv(const u8 vsel)
>  {
> @@ -241,6 +248,18 @@ int __init omap3_twl_init(void)
>         if (!cpu_is_omap34xx())
>                 return -ENODEV;
>
> +       /*
> +        * The smartreflex bit on twl4030 specifies if the setting of vol=
tage
> +        * is done over the I2C_SR path. Since this setting is independen=
t of
> +        * the actual usage of smartreflex AVS module, we enable TWL SR b=
it
> +        * by default irrespective of whether smartreflex AVS module is e=
nabled
> +        * on the OMAP side or not. This is because without this bit enab=
led,
> +        * the voltage scaling through vp forceupdate/bypass mechanism of
> +        * voltage scaling will not function on TWL over I2C_SR.
> +        */
> +       if (!twl_sr_enable_autoinit)
> +               omap3_twl_set_sr_bit(true);
> +
>         voltdm =3D voltdm_lookup("mpu_iva");
>         omap_voltage_register_pmic(voltdm, &omap3_mpu_pmic);
>
> @@ -249,3 +268,44 @@ int __init omap3_twl_init(void)
>
>         return 0;
>  }
> +
> +/**
> + * omap3_twl_set_sr_bit() - Set/Clear SR bit on TWL
> + * @enable: enable SR mode in twl or not
> + *
> + * If 'enable' is true, enables Smartreflex bit on TWL 4030 to make sure
> + * voltage scaling through OMAP SR works. Else, the smartreflex bit
> + * on twl4030 is cleared as there are platforms which use OMAP3 and T2 b=
ut
> + * use Synchronized Scaling Hardware Strategy (ENABLE_VMODE=3D1) and Dir=
ect
> + * Strategy Software Scaling Mode (ENABLE_VMODE=3D0), for setting the vo=
ltages,
> + * in those scenarios this bit is to be cleared (enable =3D false).
> + *
> + * Returns 0 on sucess, error is returned if I2C read/write fails.
> + */
> +int __init omap3_twl_set_sr_bit(bool enable)
> +{
> +       u8 temp;
> +       int ret;
> +       if (twl_sr_enable_autoinit)
> +               pr_warning("%s: unexpected multiple calls\n", __func__);
> +
> +       ret =3D twl_i2c_read_u8(TWL_MODULE_PM_RECEIVER, &temp,
> +                                       TWL4030_DCDC_GLOBAL_CFG);
> +       if (ret)
> +               goto err;
> +
> +       if (enable)
> +               temp |=3D SMARTREFLEX_ENABLE;
> +       else
> +               temp &=3D ~SMARTREFLEX_ENABLE;
> +
> +       ret =3D twl_i2c_write_u8(TWL_MODULE_PM_RECEIVER, temp,
> +                               TWL4030_DCDC_GLOBAL_CFG);
> +       if (!ret) {
> +               twl_sr_enable_autoinit =3D true;
> +               return 0;
> +       }
> +err:
> +       pr_err("%s: Error access to TWL4030 (%d)\n", __func__, ret);
> +       return ret;
> +}
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
