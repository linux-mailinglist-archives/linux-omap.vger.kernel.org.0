Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CD72C7B3C
	for <lists+linux-omap@lfdr.de>; Sun, 29 Nov 2020 21:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgK2Uwp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 Nov 2020 15:52:45 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54226 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgK2Uwp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 Nov 2020 15:52:45 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 727651C0B7C; Sun, 29 Nov 2020 21:51:45 +0100 (CET)
Date:   Sun, 29 Nov 2020 21:51:45 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Johan Hovold <johan@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/6] tty: n_gsm: Add support for serdev drivers
Message-ID: <20201129205144.GA15038@duo.ucw.cz>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-2-tony@atomide.com>
 <20200528093102.GC10358@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20200528093102.GC10358@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This is neccessary for having useful Droid 4 support, so let me try to
ressurect this.

If there's newer version (I took mine from for-5.7 branch), let me
know.

On Thu 2020-05-28 11:31:02, Johan Hovold wrote:
> On Tue, May 12, 2020 at 02:47:08PM -0700, Tony Lindgren wrote:
> > I initially though about adding the serdev support into a separate file,
> > but that will take some refactoring of n_gsm.c. And I'd like to have
> > things working first. Then later on we might want to consider splitting
> > n_gsm.c into three pieces for core, tty and serdev parts. And then maybe
> > the serdev related parts can be just moved to live under something like
> > drivers/tty/serdev/protocol/ngsm.c.
>=20
> Yeah, perhaps see where this lands first, but it should probably be done
> before merging anything.

Is drivers/tty/serdev/protocol/ngsm.c acceptable place for you?

> And it doesn't really make sense exporting these interfaces without the
> actual serdev driver as they are closely tied and cannot be reviewed
> separately anyway.

Ok, I guess keeping this in series with gnss driver makes sense? That
one should be good example.

> > @@ -150,6 +152,7 @@ struct gsm_dlci {
> >  	/* Data handling callback */
> >  	void (*data)(struct gsm_dlci *dlci, const u8 *data, int len);
> >  	void (*prev_data)(struct gsm_dlci *dlci, const u8 *data, int len);
> > +	struct gsm_serdev_dlci *ops; /* serdev dlci ops, if used */
>=20
> Please rename the struct with a "_operations" suffix as you refer to
> this as "ops" throughout.

"struct gsm_serdev_dlci_operations" is rather long, but I can do
that; unless there's better idea? ...OTOH... yes, "ops" variable is
used for this, but it is more than "operations" structure, so the new
name is misleading. I may have to rename it back.

> > +/**
> > + * gsm_serdev_get_config - read ts 27.010 config
> > + * @gsd:	serdev-gsm instance
> > + * @c:		ts 27.010 config data
> > + *
> > + * See gsm_copy_config_values() for more information.
>=20
> Please document this properly since you're exporting these
> interfaces.

Actually, let me drop this for now.

> > +/**
> > + * gsm_serdev_set_config - set ts 27.010 config
> > + * @gsd:	serdev-gsm instance
> > + * @c:		ts 27.010 config data
> > + *
> > + * See gsm_config() for more information.
> > + */
> > +int gsm_serdev_set_config(struct gsm_serdev *gsd, struct gsm_config *c)
> > +{
> > +	struct gsm_mux *gsm;
> > +
> > +	if (!gsd || !gsd->serdev || !gsd->gsm)
> > +		return -ENODEV;
>=20
> And why check for serdev here?

Having exported interfaces somehow robust looks like good thing. Do
you want me to remove it?

> > +	gsm =3D gsd->gsm;
> > +
> > +	if (line < 1 || line >=3D 63)
>=20
> Line 62 is reserved as well.

Thanks, fixed.

> > +static int gsd_dlci_receive_buf(struct gsm_serdev_dlci *ops,
> > +				const unsigned char *buf,
> > +				size_t len)
> > +{
> > +	struct gsm_serdev *gsd =3D ops->gsd;
>=20
> This looks backwards, why not pass in gsd instead?

gsm_serdev does not specify concrete dlci; we can go from dlci to gsd
but not the other way around.

=2E..which shows that gsm_serdev_dlci is not really "operations"
structure and should not be named as such.

> > +	struct gsm_mux *gsm =3D dlci->gsm;
> > +	struct gsm_serdev *gsd =3D gsm->gsd;
> > +
> > +	if (!gsd || !dlci->ops)
> > +		return;
> > +
> > +	switch (dlci->adaption) {
> > +	case 0:
>=20
> 0 isn't valid, right?
>=20
> > +	case 1:
> > +		if (dlci->ops->receive_buf)
> > +			dlci->ops->receive_buf(dlci->ops, buf, len);
> > +		break;
>=20
> What about adaption 2 with modem status? Why are you not reusing
> gsm_dlci_data()?

It is not needed in my application, I guess, so it would be difficult
to test.

> > +	default:
> > +		pr_warn("dlci%i adaption %i not yet implemented\n",
> > +			dlci->addr, dlci->adaption);
>=20
> This needs to be rate limited. Use the dev_ versions when you can.

Ok.

> > +	mutex_lock(&dlci->mutex);
> > +	ops->gsd =3D gsd;
> > +	dlci->ops =3D ops;
> > +	dlci->modem_rx =3D 0;
> > +	dlci->prev_data =3D dlci->data;
>=20
> I think this one is only used when bringing up a network interface.

prev_data is used to store data pointer, so that it can be restored on
unregister. Are you saying it is not neccessary?

> > +	dlci->data =3D gsd_dlci_data;
> > +	mutex_unlock(&dlci->mutex);
> > +
> > +	gsm_dlci_begin_open(dlci);
>=20
> Why is this here? This should be handled when opening the serial device
> (i.e. by gsmtty_open()).

This is for in-kernel users. When gnss device is opened, this is called.

> > +	/*
> > +	 * Allow some time for dlci to move to DLCI_OPEN state. Otherwise
> > +	 * the serdev consumer driver can start sending data too early during
> > +	 * the setup, and the response will be missed by gms_queue() if we
> > +	 * still have DLCI_CLOSED state.
> > +	 */
> > +	for (retries =3D 10; retries > 0; retries--) {
> > +		if (dlci->state =3D=3D DLCI_OPEN)
> > +			break;
> > +		msleep(100);
> > +	}
>=20
> What if you time out? This should be handled properly.

Ok.

> > +static int gsd_receive_buf(struct serdev_device *serdev, const u8 *dat=
a,
> > +			   size_t count)
> > +{
> > +	struct gsm_serdev *gsd =3D serdev_device_get_drvdata(serdev);
> > +	struct gsm_mux *gsm;
> > +	const unsigned char *dp;
> > +	int i;
> > +
> > +	if (WARN_ON(!gsd))
> > +		return 0;
>=20
> Probably better to take the NULL-deref. Can this ever happen?

Well, with warn_on we continue, so easier debugging. It obviously
should not happen.

> > +int gsm_serdev_register_tty_port(struct gsm_serdev *gsd, int line)
> > +{
> > +	struct gsm_serdev_dlci *ops;
> > +	unsigned int base;
> > +	int error;
> > +
> > +	if (line < 1)
> > +		return -EINVAL;
>=20
> Upper limit?

Actually, check should not be needed, as gsd_dlci_get() will check
both limits for us. Let me remove it.

> > +	ops =3D kzalloc(sizeof(*ops), GFP_KERNEL);
> > +	if (!ops)
> > +		return -ENOMEM;
> > +
> > +	ops->line =3D line;
> > +	ops->receive_buf =3D gsd_dlci_receive_buf;
> > +
> > +	error =3D gsm_serdev_register_dlci(gsd, ops);
> > +	if (error) {
> > +		kfree(ops);
> > +
> > +		return error;
> > +	}
> > +
> > +	base =3D mux_num_to_base(gsd->gsm);
> > +	tty_register_device(gsm_tty_driver, base + ops->line, NULL);
>=20
> I would expect this to be tty_port_register_device_serdev() so that
> serdev gets initialised properly for any client devices (e.g. gnss).
>=20

> > +void gsm_serdev_unregister_tty_port(struct gsm_serdev *gsd, int line)
> > +{
> > +	struct gsm_dlci *dlci;
> > +	unsigned int base;
> > +
> > +	if (line < 1)
> > +		return;
>=20
> As above.

Ok.

> > +int gsm_serdev_register_device(struct gsm_serdev *gsd)
> > +{
> > +	struct gsm_mux *gsm;
> > +	int error;
> > +
> > +	if (WARN(!gsd || !gsd->serdev || !gsd->output,
> > +		 "serdev and output must be initialized\n"))
> > +		return -EINVAL;
>=20
> Just oops if the driver is buggy and fails to set essential fields.

I find such robustness helpful, but I can remove it if you insist.

> > +void gsm_serdev_unregister_device(struct gsm_serdev *gsd)
> > +{
> > +	gsm_cleanup_mux(gsd->gsm);
> > +	mux_put(gsd->gsm);
> > +	gsd->gsm =3D NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(gsm_serdev_unregister_device);
> > +
> > +#endif	/* CONFIG_SERIAL_DEV_BUS */
>=20
> It looks like you may also have a problem with tty hangups, which serdev
> does not support currently. There are multiple paths in n_gsm which can
> trigger a hangup (e.g. based on remote input) and would likely lead to a
> crash

I don't believe we need to support hangups for the Droid 4, but
obviously it would be good not to crash. But I don't know where to
start looking, do you have any hints?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX8QJ4AAKCRAw5/Bqldv6
8ktlAJ4m4hfWc5FzWTdYyw0pcc2XZ1mn4QCgm/mP6cPGLsq7dSJVn1zYcUbKyv8=
=cPhV
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
